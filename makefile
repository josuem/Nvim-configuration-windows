move:
	$(info Move folder nvim-data to nvim-data.bak.lazy_kickstarter)
	Move-Item ..\nvim-data ..\nvim-data.bak.lazy_kickstarter
	$(info DONE!!!)

clean:
	$(info Remove nvim-data forlder)
	rm -Recurse -Force ..\nvim-data\
	$(info DONE!!!)
