.PHONY: setup
setup:
	$(info )
	$(info ************  Install dependencies and prepared development configuration  ************)
	$(info )
	$(MAKE) install-bundler
	$(MAKE) bundle-install
	$(MAKE) install-cocoapods

.PHONY: install-bundler
install-bundler:
	$(info )
	$(info ************  Install Bundler  ************)
	$(info )
	sudo gem install bundler

.PHONY: bundle-install
bundle-install:
	$(info )
	$(info ************  Bundle install dependencies  ************)
	$(info )
	bundle config path vendor/bundle
	bundle install --jobs 4 --retry 3

.PHONY: update-bundler
update-bundler:
	$(info )
	$(info ************  Update Bundler dependencies  ************)
	$(info )
	bundle config path vendor/bundle
	bundle update --jobs 4 --retry 3

.PHONY: install-cocoapods
install-cocoapods:
	$(info )
	$(info ************  Install CocoaPods dependencies and generate workspace  ************)
	$(info )
	bundle exec pod install --repo-update

.PHONY: clean
clean:
	$(info )
	$(info ***************************************)
	$(info ************  Clean cache  ************)
	$(info ***************************************)
	$(info )
	xcodebuild clean -alltargets
	rm -rf ./Pods
	rm -rf ./vendor/bundle
