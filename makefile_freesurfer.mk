SHELL := /bin/bash

# Note that the symbolic links to this makefile are in /nfs/tpolk/mind/subjects/mind???? and that's where it should be called

currdate=$$(date '+%Y-%m-%d')
currtime=$$(date '+%R')
curruser=$$USER
text1="func data with the iterative recon copied from the server $(currdate) at $(currtime) by $(curruser)."
text2="Tactile data copied to subject folder and freesurfer/func folder $(currdate) at $(currtime) by $(curruser)."
text3="make fit commands completed $(currdate) at $(currtime) by $(curruser)."


# get subject id from the path
subject=$(shell pwd|egrep -o 'mind[oy][0-9][0-9][0-9]')
id=$(shell pwd|egrep -o '[0-9][0-9][0-9]')
agegroup=$(shell pwd|egrep -o 'mind[oy]'|egrep -o '[oy]')
subjdir=/nfs/tpolk/mind/subjects/$(subject)

firstprefix=minds_reprocess/
prefix=tap16min00$(id)

psub=p$(subject)
pexam=0$$(grep Exam -m1 ./placebo/log | egrep -o '[0-9][0-9][0-9][0-9]')
psuffix=_$(pexam)
pdatadir=$(prefix)$(psuffix)
pfulldatadir=$(firstprefix)$(pdatadir)

psessdir=placebo
pdatapath=$(subjdir)/placebo/func
paudpath=$(pdatapath)/auditory/run_01
pvispath=$(pdatapath)/visual/run_01
ptactpath=$(pdatapath)/tactile/run_01
pmotpath=$(pdatapath)/motor/run_01
prestpath=$(pdatapath)/connectivity/run_01
pfsfastdir=/nfs/tpolk/mind/freesurfer/func/p$(subject)

dsub=d$(subject)
dexam=0$$(grep Exam -m1 ./drug/log | egrep -o '[0-9][0-9][0-9][0-9]')
dsuffix=_$(dexam)
ddatadir=$(prefix)$(dsuffix)
dfulldatadir=$(firstprefix)$(ddatadir)

dsessdir=drug
ddatapath=$(subjdir)/drug/func
daudpath=$(ddatapath)/auditory/run_01
dvispath=$(ddatapath)/visual/run_01
dtactpath=$(ddatapath)/tactile/run_01
dmotpath=$(ddatapath)/motor/run_01
drestpath=$(ddatapath)/connectivity/run_01
dfsfastdir=/nfs/tpolk/mind/freesurfer/func/d$(subject)

drugdir=./drug
placdir=./placebo

drugstruct=drug/anatomy/t1spgr_156sl/dicom
mrsstruct=mrsdti/anatomy/t1spgr_156sl/dicom
placstruct=placebo/anatomy/t1spgr_156sl/dicom

drugdicom=$(word 1,$(wildcard $(drugstruct)/i*MRDC*))
mrsdicom=$(word 1,$(wildcard $(mrsstruct)/i*MRDC*))
placdicom=$(word 1,$(wildcard $(placstruct)/i*MRDC*))

.PHONY: recon-all cleanfreesurfer

recon-all: /nfs/tpolk/mind/freesurfer/$(subject)/scripts/recon-all.done

/nfs/tpolk/mind/freesurfer/$(subject)/scripts/recon-all.done: $(mrsstruct) $(placstruct)
	export SUBJECTS_DIR=/nfs/tpolk/mind/freesurfer ;\
	recon-all -all -s $(subject) -i $(mrsdicom) -i $(placdicom)

#/nfs/tpolk/mind/freesurfer/$(subject)/scripts/recon-all.done: $(drugstruct) $(mrsstruct) $(placstruct)
#	export SUBJECTS_DIR=/nfs/tpolk/mind/freesurfer ;\
#	recon-all -all -s $(subject) -i $(drugdicom) -i $(mrsdicom) -i $(placdicom)

cleanfreesurfer:
	rm -r /nfs/tpolk/mind/freesurfer/$(subject)


# Holly's Iterative Recon Download Process

.PHONY: checkall placeboprep drugprep p-repdata d-repdata p-repproc d-repproc

checkall: p-repproc d-repproc


# Preps for p-repdata (based on replacedata script in /mind/incoming) by moving exisiting data to a backup folder 
placeboprep: $(placdir)
	#makes subject folder in OriginalData folder if it doesn't aleardy exist
	@if [ ! -d "/nfs/tpolk/mind/subjects/OriginalData/$(subject)" ]; then\
		mkdir /nfs/tpolk/mind/subjects/OriginalData/$(subject) ;\
	fi

	#copy placebo folder to OriginalData folder, remove contents of placebo/func, and MOVE freesurfer/func session to OriginalData folder
	@if [ ! -d "/nfs/tpolk/mind/subjects/OriginalData/$(subject)/placebo" ]; then\
		cp -r /nfs/tpolk/mind/subjects/$(subject)/placebo /nfs/tpolk/mind/subjects/OriginalData/$(subject) ;\
	fi
	
	@if [ ! -d "/nfs/tpolk/mind/freesurfer/func/OriginalData/$(psub)" ]; then\
		mv /nfs/tpolk/mind/freesurfer/func/$(psub) /nfs/tpolk/mind/freesurfer/func/OriginalData ;\
	fi
	
	
	@if [ -d "/nfs/tpolk/mind/subjects/$(smrtransform nodes.mif --linear epi2struct_mrtrix.mat nodes_dMRIreg.mif -inverseubject)/placebo/func/*" ]; then\
		rm -rf /nfs/tpolk/mind/subjects/$(subject)/placebo/func/* ;\
	fi
	
	rm -rf /nfs/tpolk/mind/incoming/$(pdatadir)
															

# Reformatted "replacedata" script from /nfs/tpolk/mind/incoming	
p-repdata: placeboprep

	@echo OK I will looking for the directory on the fMRI server

	# Next, copy the data from romero into /nfs/tpolk/mind/incoming
	@echo
	@echo Thanks. Now copying over the data from the fMRI server.
	@echo
	@echo The server will request the password for fmriuser.
	@echo
	mrtransform nodes.mif --linear epi2struct_mrtrix.mat nodes_dMRIreg.mif -inverse
	#need to check permissions on incoming folder
	rsync -av -o fmriuser@romero.engin.umich.edu:/export/subjects/$(pfulldatadir) /nfs/tpolk/mind/incoming

	# Now make subject directory
	@echo
	@echo Now making the subject directory and subdirectories and moving the data to the appropriate subdirectory
	@echo
	
	@if [ ! -d "$(subjdir)" ]; then\
		mkdir $(subjdir) \
		mkdir $(subjdir)/drug \
		mkdir $(subjdir)/mrsdti \
		mkdir $(subjdir)/placebo \
		ln -s /nfs/tpolk/mind/lib/makefiles/makefile_freesurfer.mk $(subjdir)/Makefile ;\
	fi

	# And move the data from incoming into the newly created subject directory (except for raw)

	@if [ ! -d "$(subjdir)/$(psessdir)/func" ]; then\
		mkdir $(subjdir)/$(psessdir)/func ;\
	fi

	mv /nfs/tpolk/mind/incoming/$(pdatadir)/* $(subjdir)/$(psessdir)/func

	# Now make all the symbolic links and the FSFAST directories
	@echo
	@echo Now making all the symbolic links
	@echo

	ln -s $(paudpath) /nfs/tpolk/mind/expt-auditory/placebo/$(subject)
	ln -s $(pvispath) /nfs/tpolk/mind/expt-visual/placebo/$(subject)
	ln -s $(ptactpath) /nfs/tpolk/mind/expt-tactile/placebo/$(subject)
	ln -s $(pmotpath) /nfs/tpolk/mind/expt-motor/placebo/$(subject)
	ln -s $(prestpath) /nfs/tpolk/mind/expt-rest/placebo/$(subject)
	ln -s /nfs/tpolk/mind/lib/makefiles/makefile_subject.mk $(paudpath)/Makefile
	ln -s /nfs/tpolk/mind/lib/makefiles/makefile_subject.mk $(pvispath)/Makefile
	ln -s /nfs/tpolk/mind/lib/makefiles/makefile_subject.mk $(ptactpath)/Makefile
	ln -s /nfs/tpolk/mind/lib/makefiles/makefile_subject.mk $(pmotpath)/Makefile
	ln -s /nfs/tpolk/mind/lib/makefiles/makefile_subject.mk $(prestpath)/Makefile
			
	mkdir $(pfsfastdir)
	ln -s /nfs/tpolk/mind/lib/makefiles/makefile_fsfast.mk $(pfsfastdir)/Makefile
	mkdir $(pfsfastdir)/auditory
	mkdir $(pfsfastdir)/visual
	mkdir $(pfsfastdir)/tactile
	mkdir $(pfsfastdir)/motor
	mkdir $(pfsfastdir)/auditory/001
	mkdir $(pfsfastdir)/visual/001
	mkdir $(pfsfastdir)/tactile/001
	mkdir $(pfsfastdir)/motor/001
  	#   rm $fsfastdir/auditory/001/f.nii
   	#  rm $fsfastdir/visual/001/f.nii
    	# rm $fsfastdir/tactile/001/f.nii
     	#rm $fsfastdir/motor/001/f.nii
	ln -s $(paudpath)/tprun_01.nii $(pfsfastdir)/auditory/001/f.nii
	ln -s $(pvispath)/tprun_01.nii $(pfsfastdir)/visual/001/f.nii
	ln -s $(ptactpath)/trun_01.nii $(pfsfastdir)/tactile/001/f.nii
	ln -s $(pmotpath)/tprun_01.nii $(pfsfastdir)/motor/001/f.nii
	ln -s /nfs/tpolk/mind/lib/Music.Speech.par $(pfsfastdir)/auditory/001/Music.Speech.par
	ln -s /nfs/tpolk/mind/lib/House.Face.par $(pfsfastdir)/visual/001/House.Face.par
	ln -s /nfs/tpolk/mind/lib/Right.Left.par $(pfsfastdir)/motor/001/Right.Left.par
	ln -s /nfs/tpolk/mind/lib/Music.Speech.12blks.par $(pfsfastdir)/auditory/001/Music.Speech.12blks.par
	ln -s /nfs/tpolk/mind/lib/House.Face.12blks.par $(pfsfastdir)/visual/001/House.Face.12blks.par
	ln -s /nfs/tpolk/mind/lib/Right.Left.12blks.par $(pfsfastdir)/motor/001/Right.Left.12blks.par

	#create text document noting that the iterative data was downloaded
	#cat /nfs/tpolk/mind/subjects/$(subject)/placebo/master_process_NOTES.dat
	@echo $(text1) > /nfs/tpolk/mind/subjects/$(subject)/placebo/master_process_NOTES.dat


#Runs "make fit" commands
p-repproc: p-repdata
	#copy tactile data
	cp -r /nfs/tpolk/mind/freesurfer/func/OriginalData/$(psub)/tactile/001 /nfs/tpolk/mind/subjects/$(subject)/placebo/func/tactile/run_01

	cp -r /nfs/tpolk/mind/freesurfer/func/OriginalData/$(psub)/tactile/001 /nfs/tpolk/mind/freesurfer/func/$(psub)/tactile/001

	@echo $(text2) >> /nfs/tpolk/mind/subjects/$(subject)/placebo/master_process_NOTES.dat
	
	#run make fit commands
	cd /nfs/tpolk/mind/subjects/$(subject)/placebo/func/auditory/run_01 && $(MAKE) fit
	cd /nfs/tpolk/mind/subjects/$(subject)/placebo/func/motor/run_01 && $(MAKE) fit
	cd /nfs/tpolk/mind/subjects/$(subject)/placebo/func/tactile/run_01 && $(MAKE) fit
	cd /nfs/tpolk/mind/subjects/$(subject)/placebo/func/visual/run_01 && $(MAKE) fit

	@echo $(text3) >> /nfs/tpolk/mind/subjects/$(subject)/placebo/master_process_NOTES.dat

	#make fit completed run make distinct and make all manually from the freesurfer/func folder.


#Preps for d-repdata (based on replacedata script in /mind/incoming) by moving exisiting data to a backup folder
drugprep: $(drugdir) 
	#makes subject folder in OriginalData folder if it doesn't aleardy exist
	@if [ ! -d "/nfs/tpolk/mind/subjects/OriginalData/$(subject)" ]; then\
		mkdir /nfs/tpolk/mind/subjects/OriginalData/$(subject) ;\
	fi

	#copy drug folder to OriginalData folder, remove contents of drug/func, and MOVE freesurfer/func session to OriginalData folder
	@if [ ! -d "/nfs/tpolk/mind/subjects/OriginalData/$(subject)/drug" ]; then\
		cp -r /nfs/tpolk/mind/subjects/$(subject)/drug /nfs/tpolk/mind/subjects/OriginalData/$(subject) ;\
	fi
	
	@if [ ! -d "/nfs/tpolk/mind/freesurfer/func/OriginalData/$(dsub)" ]; then\
		mv /nfs/tpolk/mind/freesurfer/func/$(dsub) /nfs/tpolk/mind/freesurfer/func/OriginalData ;\
	fi
	
	
	@if [ -d "/nfs/tpolk/mind/subjects/$(smrtransform nodes.mif --linear epi2struct_mrtrix.mat nodes_dMRIreg.mif -inverseubject)/drug/func/*" ]; then\
		rm -rf /nfs/tpolk/mind/subjects/$(subject)/drug/func/* ;\
	fi	

	rm -rf /nfs/tpolk/mind/incoming/$(ddatadir)	


#Reformatted "replacedata" script from /nfs/tpolk/mind/incoming	
d-repdata: drugprep
	
	@echo OK I will looking for the directory on the fMRI server

	# Next, copy the data from romero into /nfs/tpolk/mind/incoming
	@echo
	@echo Thanks. Now copying over the data from the fMRI server.
	@echo
	@echo The server will request the password for fmriuser.
	@echo
	
	#need to check permissions on incoming folder
	rsync -av -o fmriuser@romero.engin.umich.edu:/export/subjects/$(dfulldatadir) /nfs/tpolk/mind/incoming

	# Now make subject directory
	@echo
	@echo Now making the subject directory and subdirectories and moving the data to the appropriate subdirectory
	@echo
	
	@if [ ! -d "$(subjdir)" ]; then\
		mkdir $(subjdir) \
		mkdir $(subjdir)/drug \
		mkdir $(subjdir)/mrsdti \
		mkdir $(subjdir)/placebo \
		ln -s /nfs/tpolk/mind/lib/makefiles/makefile_freesurfer.mk $(subjdir)/Makefile ;\
	fi

	# And move the data from incoming into the newly created subject directory (except for raw)

	@if [ ! -d "$(subjdir)/$(dsessdir)/func" ]; then\
		mkdir $(subjdir)/$(dsessdir)/func ;\
	fi

	mv /nfs/tpolk/mind/incoming/$(ddatadir)/* $(subjdir)/$(dsessdir)/func

	# Now make all the symbolic links and the FSFAST directories
	@echo
	@echo Now making all the symbolic links
	@echo
			
	ln -s $(daudpath) /nfs/tpolk/mind/expt-auditory/drug/$(subject)
	ln -s $(dvispath) /nfs/tpolk/mind/expt-visual/drug/$(subject)
	ln -s $(dtactpath) /nfs/tpolk/mind/expt-tactile/drug/$(subject)
	ln -s $(dmotpath) /nfs/tpolk/mind/expt-motor/drug/$(subject)
	ln -s $(drestpath) /nfs/tpolk/mind/expt-rest/drug/$(subject)
	ln -s /nfs/tpolk/mind/lib/makefiles/makefile_subject.mk $(daudpath)/Makefile
	ln -s /nfs/tpolk/mind/lib/makefiles/makefile_subject.mk $(dvispath)/Makefile
	ln -s /nfs/tpolk/mind/lib/makefiles/makefile_subject.mk $(dtactpath)/Makefile
	ln -s /nfs/tpolk/mind/lib/makefiles/makefile_subject.mk $(dmotpath)/Makefile
	ln -s /nfs/tpolk/mind/lib/makefiles/makefile_subject.mk $(drestpath)/Makefile
	
	mkdir $(dfsfastdir)
	ln -s /nfs/tpolk/mind/lib/makefiles/makefile_fsfast.mk $(dfsfastdir)/Makefile
	mkdir $(dfsfastdir)/auditory
	mkdir $(dfsfastdir)/visual
	mkdir $(dfsfastdir)/tactile
	mkdir $(dfsfastdir)/motor
	mkdir $(dfsfastdir)/auditory/001
	mkdir $(dfsfastdir)/visual/001
	mkdir $(dfsfastdir)/tactile/001
	mkdir $(dfsfastdir)/motor/001
	#      rm $fsfastdir/auditory/001/f.nii
	#      rm $fsfastdir/visual/001/f.nii
	#      rm $fsfastdir/tactile/001/f.nii
	#      rm $fsfastdir/motor/001/f.nii
	ln -s $(daudpath)/tprun_01.nii $(dfsfastdir)/auditory/001/f.nii
	ln -s $(dvispath)/tprun_01.nii $(dfsfastdir)/visual/001/f.nii
	ln -s $(dtactpath)/trun_01.nii $(dfsfastdir)/tactile/001/f.nii
	ln -s $(dmotpath)/tprun_01.nii $(dfsfastdir)/motor/001/f.nii
	ln -s /nfs/tpolk/mind/lib/Music.Speech.par $(dfsfastdir)/auditory/001/Music.Speech.par
	ln -s /nfs/tpolk/mind/lib/House.Face.par $(dfsfastdir)/visual/001/House.Face.par
	ln -s /nfs/tpolk/mind/lib/Right.Left.par $(dfsfastdir)/motor/001/Right.Left.par
	ln -s /nfs/tpolk/mind/lib/Music.Speech.12blks.par $(dfsfastdir)/auditory/001/Music.Speech.12blks.par
	ln -s /nfs/tpolk/mind/lib/House.Face.12blks.par $(dfsfastdir)/visual/001/House.Face.12blks.par
	ln -s /nfs/tpolk/mind/lib/Right.Left.12blks.par $(dfsfastdir)/motor/001/Right.Left.12blks.par
	
	#create text document noting that the iterative data was downloaded
	#cat /nfs/tpolk/mind/subjects/$(subject)/drug/master_process_NOTES.dat
	@echo $(text1) > /nfs/tpolk/mind/subjects/$(subject)/drug/master_process_NOTES.dat


#Runs "make fit" commands
d-repproc: d-repdata
	#copy tactile data
	cp -r /nfs/tpolk/mind/freesurfer/func/OriginalData/$(dsub)/tactile/001 /nfs/tpolk/mind/subjects/$(subject)/drug/func/tactile/run_01

	cp -r /nfs/tpolk/mind/freesurfer/func/OriginalData/$(dsub)/tactile/001 /nfs/tpolk/mind/freesurfer/func/$(dsub)/tactile/001

	@echo $(text2) >> /nfs/tpolk/mind/subjects/$(subject)/drug/master_process_NOTES.dat
	
	#run make fit commands
	cd /nfs/tpolk/mind/subjects/$(subject)/drug/func/auditory/run_01 && $(MAKE) fit
	cd /nfs/tpolk/mind/subjects/$(subject)/drug/func/motor/run_01 && $(MAKE) fit
	cd /nfs/tpolk/mind/subjects/$(subject)/drug/func/tactile/run_01 && $(MAKE) fit
	cd /nfs/tpolk/mind/subjects/$(subject)/drug/func/visual/run_01 && $(MAKE) fit

	@echo $(text3) >> /nfs/tpolk/mind/subjects/$(subject)/drug/master_process_NOTES.dat

	#make fit completed. Run make distinct and make all manually from the freesurfer/func folder.




# Below is Shannon's makefile for quality control

.PHONY: quality thing new_dir pic

new_dir:
	mkdir ./figures/


quality :   ./figures/$(subject)_AUD_D_M.png ./figures/$(subject)_AUD_P_M.png ./figures/$(subject)_CON_D_M.png ./figures/$(subject)_CON_P_M.png ./figures/$(subject)_MOT_D_M.png ./figures/$(subject)_MOT_P_M.png ./figures/$(subject)_TAC_D_M.png ./figures/$(subject)_TAC_P_M.png ./figures/$(subject)_VIS_D_M.png ./figures/$(subject)_VIS_P_M.png ./figures/$(subject)_AUD_D_R_001.jpg ./figures/$(subject)_AUD_P_R_001.jpg ./figures/$(subject)_CON_D_R_001.jpg ./figures/$(subject)_CON_P_R_001.jpg ./figures/$(subject)_MOT_D_R_001.jpg ./figures/$(subject)_MOT_P_R_001.jpg ./figures/$(subject)_TAC_D_R_001.jpg ./figures/$(subject)_TAC_P_R_001.jpg ./figures/$(subject)_VIS_D_R_001.jpg ./figures/$(subject)_VIS_P_R_001.jpg ./figures/$(subject)_B.png ../Altered_Figs/$(subject)_AUD_D_M.png ../Altered_Figs/$(subject)_CON_D_M.png ../Altered_Figs/$(subject)_MOT_D_M.png ../Altered_Figs/$(subject)_TAC_D_M.png ../Altered_Figs/$(subject)_VIS_D_M.png ../Altered_Figs/$(subject)_AUD_P_M.png ../Altered_Figs/$(subject)_CON_P_M.png ../Altered_Figs/$(subject)_MOT_P_M.png ../Altered_Figs/$(subject)_TAC_P_M.png ../Altered_Figs/$(subject)_VIS_P_M.png ../Altered_Figs/$(subject)_AUD_D_R.jpg  ../Altered_Figs/$(subject)_CON_D_R.jpg ../Altered_Figs/$(subject)_MOT_D_R.jpg ../Altered_Figs/$(subject)_TAC_D_R.jpg ../Altered_Figs/$(subject)_VIS_D_R.jpg ../Altered_Figs/$(subject)_AUD_P_R.jpg ../Altered_Figs/$(subject)_CON_P_R.jpg ../Altered_Figs/$(subject)_MOT_P_R.jpg ../Altered_Figs/$(subject)_TAC_P_R.jpg ../Altered_Figs/$(subject)_VIS_P_R.jpg ../Altered_Figs/$(subject)_BEHAV.png
	
# First step is to get the motion graphs for each subject.  There is a motion
# graph for placebo and drug in auditory, connectivity, motor, tactile and visual
# for each subject.  This is located in (drug_status)/func/(group)/run_01.  I run the
# matlab script "motion" to save these images as (subjectid)_(group)_D/P_M.png.


./figures/$(subject)_AUD_D_M.png:  drug/func/auditory/run_01/realign.dat 
	cd drug/func/auditory/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, motion('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_AUD_D_M', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_AUD_P_M.png:  placebo/func/auditory/run_01/realign.dat 
	cd placebo/func/auditory/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, motion('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_AUD_P_M', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_CON_D_M.png:  drug/func/connectivity/run_01/realign.dat 
	cd drug/func/connectivity/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, motion('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_CON_D_M', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_CON_P_M.png:  placebo/func/connectivity/run_01/realign.dat 
	cd placebo/func/connectivity/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, motion('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_CON_P_M', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_MOT_D_M.png:  drug/func/motor/run_01/realign.dat 
	cd drug/func/motor/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, motion('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_MOT_D_M', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_MOT_P_M.png:  placebo/func/motor/run_01/realign.dat 
	cd placebo/func/motor/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, motion('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_MOT_P_M', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_TAC_D_M.png:  drug/func/tactile/run_01/realign.dat  
	cd drug/func/tactile/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, motion('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_TAC_D_M', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_TAC_P_M.png:  placebo/func/tactile/run_01/realign.dat 
	cd placebo/func/tactile/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, motion('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_TAC_P_M', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_VIS_D_M.png:  drug/func/visual/run_01/realign.dat 
	cd drug/func/visual/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, motion('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_VIS_D_M', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_VIS_P_M.png:  placebo/func/visual/run_01/realign.dat 
	cd placebo/func/visual/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, motion('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_VIS_P_M', '$<'), catch, 'Error running figs', end; exit"

# Second step is to get the raw BOLD images for each subject.  There is a raw
# BOLD image for placebo and drug in auditory, connectivity, motor, tactile and visual
# for each subject.  This is located in (drug_status)/func/(group)/run_01.  I run the
# matlab script "bold" to save these images as (subjectid)_(group)_D/P_R_001.png.

pic: ./figures/$(subject)_AUD_D_R_001.jpg

./figures/$(subject)_AUD_D_R_001.jpg:  drug/func/auditory/run_01/run_01.nii 
	cd drug/func/auditory/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, bold('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_AUD_D_R', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_AUD_P_R_001.jpg:  placebo/func/auditory/run_01/run_01.nii 
	cd placebo/func/auditory/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, bold('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_AUD_P_R', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_CON_D_R_001.jpg:  drug/func/connectivity/run_01/run_01.nii 
	cd drug/func/connectivity/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, bold('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_CON_D_R', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_CON_P_R_001.jpg:  placebo/func/connectivity/run_01/run_01.nii 
	cd placebo/func/connectivity/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, bold('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_CON_P_R', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_MOT_D_R_001.jpg:  drug/func/motor/run_01/run_01.nii 
	cd drug/func/motor/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, bold('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_MOT_D_R', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_MOT_P_R_001.jpg:  placebo/func/motor/run_01/run_01.nii 
	cd placebo/func/motor/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, bold('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_MOT_P_R', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_TAC_D_R_001.jpg:  drug/func/tactile/run_01/run_01.nii 
	cd drug/func/tactile/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, bold('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_TAC_D_R', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_TAC_P_R_001.jpg:  placebo/func/tactile/run_01/run_01.nii 
	cd placebo/func/tactile/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, bold('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_TAC_P_R', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_VIS_D_R_001.jpg:  drug/func/visual/run_01/run_01.nii 
	cd drug/func/visual/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, bold('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_VIS_D_R', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_VIS_P_R_001.jpg:  placebo/func/visual/run_01/run_01.nii 
	cd placebo/func/visual/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, bold('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_VIS_P_R', '$<'), catch, 'Error running figs', end; exit"

# The third step is save a table of the behavioral data as an image.  This
# runs the matlab script "behavior" to produce this image from the behavioral
# data in the mastersheet.  It is saved as (subjectid)_B.png.

./figures/$(subject)_B.png:  /nfs/tpolk/mind/data/mastersheet/mindmaster_clean.csv 
	cd /nfs/tpolk/mind/data/mastersheet/ ; \
	matlab -nosplash -nodesktop -r "try, behavior('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_B'), catch, 'Error running figs', end; exit"

# The images I saved above are too large and do not have a subject label 
# printed on the image. The python script "alter2.py" resizes the image and 
# prints the subject ID on the image.  It save this new, altered image in 
# a new location, so that every subject's picture is in the same folder.
# I call a specific version of python to run the script, then provide and input
# image and ouptut image.  This is done to all the motion graphs, the bold
# images, and the behavioral table image.

../Altered_Figs/$(subject)_AUD_D_M.png: ./figures/$(subject)_AUD_D_M.png
	python /nfs/tpolk/mind/bin/alter2.py ./figures/$(subject)_AUD_D_M.png ../Altered_Figs/$(subject)_AUD_D_M.png $(subject)_AUD_D_M

../Altered_Figs/$(subject)_CON_D_M.png: ./figures/$(subject)_CON_D_M.png
	python /nfs/tpolk/mind/bin/alter2.py ./figures/$(subject)_CON_D_M.png ../Altered_Figs/$(subject)_CON_D_M.png $(subject)_CON_D_M

../Altered_Figs/$(subject)_MOT_D_M.png: ./figures/$(subject)_MOT_D_M.png
	python /nfs/tpolk/mind/bin/alter2.py ./figures/$(subject)_MOT_D_M.png ../Altered_Figs/$(subject)_MOT_D_M.png $(subject)_MOT_D_M

../Altered_Figs/$(subject)_TAC_D_M.png: ./figures/$(subject)_TAC_D_M.png
	python /nfs/tpolk/mind/bin/alter2.py ./figures/$(subject)_TAC_D_M.png ../Altered_Figs/$(subject)_TAC_D_M.png $(subject)_TAC_D_M

../Altered_Figs/$(subject)_VIS_D_M.png: ./figures/$(subject)_VIS_D_M.png
	python /nfs/tpolk/mind/bin/alter2.py ./figures/$(subject)_VIS_D_M.png ../Altered_Figs/$(subject)_VIS_D_M.png $(subject)_VIS_D_M

../Altered_Figs/$(subject)_AUD_P_M.png: ./figures/$(subject)_AUD_P_M.png
	python /nfs/tpolk/mind/bin/alter2.py ./figures/$(subject)_AUD_P_M.png ../Altered_Figs/$(subject)_AUD_P_M.png $(subject)_AUD_P_M

../Altered_Figs/$(subject)_CON_P_M.png: ./figures/$(subject)_CON_P_M.png
	python /nfs/tpolk/mind/bin/alter2.py ./figures/$(subject)_CON_P_M.png ../Altered_Figs/$(subject)_CON_P_M.png $(subject)_CON_P_M

../Altered_Figs/$(subject)_MOT_P_M.png: ./figures/$(subject)_MOT_P_M.png
	python /nfs/tpolk/mind/bin/alter2.py ./figures/$(subject)_MOT_P_M.png ../Altered_Figs/$(subject)_MOT_P_M.png $(subject)_MOT_P_M

../Altered_Figs/$(subject)_TAC_P_M.png: ./figures/$(subject)_TAC_P_M.png
	python /nfs/tpolk/mind/bin/alter2.py ./figures/$(subject)_TAC_P_M.png ../Altered_Figs/$(subject)_TAC_P_M.png $(subject)_TAC_P_M

../Altered_Figs/$(subject)_VIS_P_M.png: ./figures/$(subject)_VIS_P_M.png
	python /nfs/tpolk/mind/bin/alter2.py ./figures/$(subject)_VIS_P_M.png ../Altered_Figs/$(subject)_VIS_P_M.png $(subject)_VIS_P_M


../Altered_Figs/$(subject)_AUD_D_R.jpg: ./figures/$(subject)_AUD_D_R_001.jpg
	python /nfs/tpolk/mind/bin/alter2.py ./figures/$(subject)_AUD_D_R_001.jpg ../Altered_Figs/$(subject)_AUD_D_R.jpg $(subject)_AUD_D_R

../Altered_Figs/$(subject)_CON_D_R.jpg: ./figures/$(subject)_CON_D_R_001.jpg
	python /nfs/tpolk/mind/bin/alter2.py ./figures/$(subject)_CON_D_R_001.jpg ../Altered_Figs/$(subject)_CON_D_R.jpg $(subject)_CON_D_R

../Altered_Figs/$(subject)_MOT_D_R.jpg: ./figures/$(subject)_MOT_D_R_001.jpg
	python /nfs/tpolk/mind/bin/alter2.py ./figures/$(subject)_MOT_D_R_001.jpg ../Altered_Figs/$(subject)_MOT_D_R.jpg $(subject)_MOT_D_R

../Altered_Figs/$(subject)_TAC_D_R.jpg: ./figures/$(subject)_TAC_D_R_001.jpg
	python /nfs/tpolk/mind/bin/alter2.py ./figures/$(subject)_TAC_D_R_001.jpg ../Altered_Figs/$(subject)_TAC_D_R.jpg $(subject)_TAC_D_R

../Altered_Figs/$(subject)_VIS_D_R.jpg: ./figures/$(subject)_VIS_D_R_001.jpg
	python /nfs/tpolk/mind/bin/alter2.py ./figures/$(subject)_VIS_D_R_001.jpg ../Altered_Figs/$(subject)_VIS_D_R.jpg $(subject)_VIS_D_R

../Altered_Figs/$(subject)_AUD_P_R.jpg: ./figures/$(subject)_AUD_P_R_001.jpg
	python /nfs/tpolk/mind/bin/alter2.py ./figures/$(subject)_AUD_P_R_001.jpg ../Altered_Figs/$(subject)_AUD_P_R.jpg $(subject)_AUD_P_R

../Altered_Figs/$(subject)_CON_P_R.jpg: ./figures/$(subject)_CON_P_R_001.jpg
	python /nfs/tpolk/mind/bin/alter2.py ./figures/$(subject)_CON_P_R_001.jpg ../Altered_Figs/$(subject)_CON_P_R.jpg $(subject)_CON_P_R

../Altered_Figs/$(subject)_MOT_P_R.jpg: ./figures/$(subject)_MOT_P_R_001.jpg
	python /nfs/tpolk/mind/bin/alter2.py ./figures/$(subject)_MOT_P_R_001.jpg ../Altered_Figs/$(subject)_MOT_P_R.jpg $(subject)_MOT_P_R

../Altered_Figs/$(subject)_TAC_P_R.jpg: ./figures/$(subject)_TAC_P_R_001.jpg
	python /nfs/tpolk/mind/bin/alter2.py ./figures/$(subject)_TAC_P_R_001.jpg ../Altered_Figs/$(subject)_TAC_P_R.jpg $(subject)_TAC_P_R

../Altered_Figs/$(subject)_VIS_P_R.jpg: ./figures/$(subject)_VIS_P_R_001.jpg
	python /nfs/tpolk/mind/bin/alter2.py ./figures/$(subject)_VIS_P_R_001.jpg ../Altered_Figs/$(subject)_VIS_P_R.jpg $(subject)_VIS_P_R

../Altered_Figs/$(subject)_BEHAV.png: ./figures/$(subject)_B.png
	python /nfs/tpolk/mind/bin/alter2.py ./figures/$(subject)_B.png ../Altered_Figs/$(subject)_BEHAV.png $(subject)_BEHAV

# After this, all the prepared images are in ONE folder, Altered_Figs, and
# are ready to be compiled into pdfs. 


thing:
	module load anaconda3



# Shannon DWI

FSfolder=/nfs/tpolk/mind/PRACTICE/DWI/DWI_Freesurfer/$(subject)
MRfolder=/nfs/tpolk/mind/PRACTICE/DWI/DWI_Other/$(subject)
OrigFSfolder=/nfs/tpolk/mind/freesurfer/$(subject)/mri
OrigMRfolder=/nfs/tpolk/mind/dti/$(subject)/DTI_TOPUP_32/APPLYTOPUP

.PHONY: dwi_part1 dwi_part2 calc link1 link2 link3 avrep dwi_fa

avrep: $(MRfolder)/dwi_response.txt

dwi_part1a: link1 link2

dwi_part1b: $(MRfolder)/5tt.mif

dwi_part2: $(MRfolder)/dwi_connectome.csv

dwi_fa: $(MRfolder)/fa_connectome.csv

$(MRfolder)/dwi.mif: $(OrigMRfolder)/topup_dtiDataSet.nii $(OrigMRfolder)/topup_dtiDataSet.bvec $(OrigMRfolder)/topup_dtiDataSet.bval
	mrconvert $(OrigMRfolder)/topup_dtiDataSet.nii -fslgrad $(OrigMRfolder)/topup_dtiDataSet.bvec $(OrigMRfolder)/topup_dtiDataSet.bval $(MRfolder)/dwi.mif

$(MRfolder)/dwi_biascorrected.mif: $(MRfolder)/dwi.mif
	dwibiascorrect -ants $(MRfolder)/dwi.mif $(MRfolder)/dwi_biascorrected.mif

$(MRfolder)/dwi_temp_mask.mif: $(MRfolder)/dwi.mif
	dwi2mask $(MRfolder)/dwi.mif $(MRfolder)/dwi_temp_mask.mif

link1: $(MRfolder)/dwi_biascorrected.mif $(MRfolder)/dwi_temp_mask.mif
	ln -sr $(MRfolder)/dwi_biascorrected.mif /nfs/tpolk/mind/PRACTICE/DWI/dwiintensitynorm/dwi_input/$(subject).mif
	
link2: $(MRfolder)/dwi_temp_mask.mif
	ln -sr $(MRfolder)/dwi_temp_mask.mif /nfs/tpolk/mind/PRACTICE/DWI/dwiintensitynorm/mask_input/$(subject).mif
	
#dwiintensitynorm ../dwiintensitynorm/dwi_input/ ../dwiintensitynorm/mask_input/ ../dwiintensitynorm/dwi_output/ ../dwiintensitynorm/fa_template.mif ../dwiintensitynorm/fa_template_wm_mask.mif

$(MRfolder)/dwi_unbiased_normalised.mif:  /nfs/tpolk/mind/PRACTICE/DWI/dwiintensitynorm/dwi_output/$(subject).mif
	ln -sr /nfs/tpolk/mind/PRACTICE/DWI/dwiintensitynorm/dwi_output/$(subject).mif $(MRfolder)/dwi_unbiased_normalised.mif

link3: $(MRfolder)/dwi_unbiased_normalised.mif 


$(MRfolder)/b0_preproc_bias.nii: $(MRfolder)/dwi_unbiased_normalised.mif 
	dwiextract -force $(MRfolder)/dwi_unbiased_normalised.mif  $(MRfolder)/b0_preproc_bias.nii -bzero

calc: $(MRfolder)/b0_preproc_bias.nii
	mrcalc -force $(OrigFSfolder)/aseg.mgz 41 -eq $(OrigFSfolder)/aseg.mgz 2 -eq -add $(FSfolder)/wm.nii

$(FSfolder)/nu.nii: $(OrigFSfolder)/nu.mgz calc
	mrconvert -force $(OrigFSfolder)/nu.mgz $(FSfolder)/nu.nii 

$(FSfolder)/brain.nii: $(OrigFSfolder)/brain.mgz
	mrconvert -force $(OrigFSfolder)/brain.mgz $(FSfolder)/brain.nii

$(MRfolder)/epi2struct: $(MRfolder)/dwi_unbiased_normalised.mif $(FSfolder)/nu.nii $(FSfolder)/brain.nii $(FSfolder)/wm.nii
	epi_reg --epi=$(MRfolder)/b0_preproc_bias.nii --t1=$(FSfolder)/nu.nii --t1brain=$(FSfolder)/brain.nii --out=$(MRfolder)/epi2struct --wmseg=$(FSfolder)/wm.nii

$(MRfolder)/epi2struct_mrtrix.mat: $(MRfolder)/epi2struct
	transformconvert -force $(MRfolder)/epi2struct.mat $(MRfolder)/b0_preproc_bias.nii $(FSfolder)/nu.nii flirt_import $(MRfolder)/epi2struct_mrtrix.mat

$(MRfolder)/nu_dMRIreg.nii: $(FSfolder)/nu.nii $(MRfolder)/epi2struct_mrtrix.mat
	mrtransform -force $(FSfolder)/nu.nii --linear $(MRfolder)/epi2struct_mrtrix.mat $(MRfolder)/nu_dMRIreg.nii -inverse

$(MRfolder)/5tt.mif: $(MRfolder)/nu_dMRIreg.nii
	5ttgen -force fsl $(MRfolder)/nu_dMRIreg.nii $(MRfolder)/5tt.mif -nocrop -force

$(MRfolder)/dwi_response.txt: 
	dwi2response tournier $(MRfolder)/dwi_unbiased_normalised.mif $(MRfolder)/dwi_response.txt


# average_response */dwi_response.txt ../group_average_response.txt

$(MRfolder)/dwi_fod.mif: /nfs/tpolk/mind/PRACTICE/DWI/group_average_response.txt
	dwi2fod csd $(MRfolder)/dwi_unbiased_normalised.mif /nfs/tpolk/mind/PRACTICE/DWI/group_average_response.txt $(MRfolder)/dwi_fod.mif

$(MRfolder)/dwi_nodes.mif: $(OrigFSfolder)/aparc+aseg.mgz  
	mrtransform $(OrigFSfolder)/aparc+aseg.mgz --linear $(MRfolder)/epi2struct_mrtrix.mat $(MRfolder)/dwi_nodes.mif -inverse

$(MRfolder)/dwi_nodes_reg.mif:  $(MRfolder)/dwi_nodes.mif /usr/local/freesurfer/FreeSurferColorLUT.txt /usr/local/mrtrix3/share/mrtrix3/labelconvert/fs_default.txt
	labelconvert  $(MRfolder)/dwi_nodes.mif /usr/local/freesurfer/FreeSurferColorLUT.txt /usr/local/mrtrix3/share/mrtrix3/labelconvert/fs_default.txt $(MRfolder)/dwi_nodes_reg.mif

$(MRfolder)/dwi_10M.tck: $(MRfolder)/dwi_fod.mif
	tckgen $(MRfolder)/dwi_fod.mif $(MRfolder)/dwi_10M.tck -act $(MRfolder)/5tt.mif -backtrack -crop_at_gmwmi -seed_dynamic $(MRfolder)/dwi_fod.mif -select 10000000 -nthreads 8 -maxlength 250 -cutoff 0.05

$(MRfolder)/dwi_sift.txt: $(MRfolder)/dwi_10M.tck $(MRfolder)/dwi_fod.mif 
	tcksift2 $(MRfolder)/dwi_10M.tck $(MRfolder)/dwi_fod.mif $(MRfolder)/dwi_sift.txt -act $(MRfolder)/5tt.mif -out_mu $(MRfolder)/sift_mu.txt -out_coeffs $(MRfolder)/sift_coeffs.txt -nthreads 8

$(MRfolder)/dwi_connectome.csv: $(MRfolder)/dwi_10M.tck $(MRfolder)/dwi_nodes_reg.mif $(MRfolder)/dwi_sift.txt
	tck2connectome $(MRfolder)/dwi_10M.tck $(MRfolder)/dwi_nodes_reg.mif $(MRfolder)/dwi_connectome.csv -zero_diagonal -tck_weights_in $(MRfolder)/dwi_sift.txt





$(MRfolder)/tensor.mif: $(MRfolder)/dwi.mif $(MRfolder)/dwi_temp_mask.mif
	dwi2tensor $(MRfolder)/dwi.mif $(MRfolder)/tensor.mif -mask $(MRfolder)/dwi_temp_mask.mif

$(MRfolder)/fa_image.mif: $(MRfolder)/tensor.mif
	tensor2metric $(MRfolder)/tensor.mif  -fa $(MRfolder)/fa_image.mif

$(MRfolder)/fa_mean_scalars.csv: $(MRfolder)/dwi_10M.tck $(MRfolder)/fa_image.mif
	tcksample $(MRfolder)/dwi_10M.tck $(MRfolder)/fa_image.mif $(MRfolder)/fa_mean_scalars.csv -stat_tck mean

$(MRfolder)/fa_connectome.csv: $(MRfolder)/dwi_10M.tck $(MRfolder)/dwi_nodes_reg.mif $(MRfolder)/fa_mean_scalars.csv
	tck2connectome $(MRfolder)/dwi_10M.tck $(MRfolder)/dwi_nodes_reg.mif $(MRfolder)/fa_connectome.csv -zero_diagonal -scale_file  $(MRfolder)/fa_mean_scalars.csv -stat_edge mean

print-%  : ; @@echo $* = $($*)

