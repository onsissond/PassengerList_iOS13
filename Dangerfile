# plugin для поиска оставленных print и вывода предупреждений
ios_logs.check

# размер PR
def insertions(pattern)
	(git.modified_files + git.added_files)
	.select { |file| file.include? pattern }
	.map { |file| git.diff.stats[:files].fetch(file, {}).fetch(:insertions, 0) }
	.reduce(:+) || 0
end

def release_branch?(branch_for_head)
    /^release\/(transport|avia|train|bus)-[0-9\.]+$/.match(branch_for_head)
end

def feature_or_test_branch?(branch_for_head)
    /^(feature|tests)\/((MAPP-[0-9]+)|(NO-ISSUE))(-|_)[a-zA-Z0-9_-]+$/.match(branch_for_head)
end

def check_if_release_pr_title_does_not_match(pr_title)
    # проверка названия PR
    if /^NO-ISSUE: [Rr]elease/.match(pr_title) == nil
        fail("Заголовок релиза должен начинаться на NO-ISSUE: Release или NO-ISSUE: release")
    end
end

def check_if_feature_pr_title_does_not_match(branch_for_head, pr_title)
    branchname_error = "Название PR должно начинаться с MAPP-{номер задачи} или NO-ISSUE и должно совпадать с таким-же названием ветки"

    # проверка названия PR
    branchname_matches = /MAPP-[0-9]+|NO-ISSUE/.match(branch_for_head)
    prname_matches = /^(MAPP-[0-9]+|NO-ISSUE)/.match(pr_title)

    fail(branchname_error) if branchname_matches == nil
    fail("Название PR должно начинаться с MAPP-{номер задачи} или NO-ISSUE") if prname_matches == nil
    
    # проверка на совпадение названия PR и названия ветки
    if branchname_matches != nil and prname_matches != nil and branchname_matches[0].downcase != prname_matches[0].downcase
        fail(branchname_error)
    end
end

def branchname_matches_not_found
    fail(
        %"
        Если ветка начинается на feature/ или test/, то далее должно быть MAPP-{номер задачи} или NO-ISSUE, 
        если ветка начинается на release/, то далее должно быть название продукта (transport, avia, train, bus) и номер версии, 
        к примеру release/transport-3.18.1
        "
    )
end


pbxproj_insertions = insertions('.pbxproj')
snapshots_insertions = insertions('/__Snapshots__/')
insertions = github.pr_json["additions"] - pbxproj_insertions - snapshots_insertions

message("Размер PR: #{insertions} строк добавлено + #{pbxproj_insertions} в файлах pbxproj + #{snapshots_insertions} в snapshot'ах для тестов. Всего: #{github.pr_json["additions"]}")
if insertions > 500
    fail("Размер PR (#{insertions} строк) превышает максимальный размер (500 строк).")
elsif insertions > 250
    warn("Размер PR (#{insertions} строк) превышает рекомендуемый размер (250 строк).")    
end

if release_branch?(github.branch_for_head)
    check_if_release_pr_title_does_not_match(github.pr_title)
elsif feature_or_test_branch?(github.branch_for_head)
    check_if_feature_pr_title_does_not_match(github.branch_for_head, github.pr_title)
else
    branchname_matches_not_found
end

# проверка описания PR
warn("Отсутствует описание PR") if github.pr_body.empty?
