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
pexam=0$$(grep Exam -m1 ./placebodti/log | egrep -o '[0-9][0-9][0-9][0-9]')
psuffix=_$(pexam)
pdatadir=$(prefix)$(psuffix)
pfulldatadir=$(firstprefix)$(pdatadir)

psessdir=placebodti
pdatapath=$(subjdir)/placebodti/func
paudpath=$(pdatapath)/auditory/run_01
pvispath=$(pdatapath)/visual/run_01
ptactpath=$(pdatapath)/tactile/run_01
pmotpath=$(pdatapath)/motor/run_01
prestpath=$(pdatapath)/connectivity/run_01
pfsfastdir=/nfs/tpolk/mind/freesurfer/func/p$(subject)

#dsub=d$(subject)
#dexam=0$$(grep Exam -m1 ./drug/log | egrep -o '[0-9][0-9][0-9][0-9]')
#dsuffix=_$(dexam)
#ddatadir=$(prefix)$(dsuffix)
#dfulldatadir=$(firstprefix)$(ddatadir)
#
#dsessdir=drug
#ddatapath=$(subjdir)/drug/func
#daudpath=$(ddatapath)/auditory/run_01
#dvispath=$(ddatapath)/visual/run_01
#dtactpath=$(ddatapath)/tactile/run_01
#dmotpath=$(ddatapath)/motor/run_01
#drestpath=$(ddatapath)/connectivity/run_01
#dfsfastdir=/nfs/tpolk/mind/freesurfer/func/d$(subject)
#
#drugdir=./drug

placdir=./placebodti

#drugstruct=drug/anatomy/t1spgr_156sl/dicom
mrsstruct=mrs/anatomy/t1spgr_156sl/dicom
placstruct=placebodti/anatomy/t1spgr_156sl/dicom

#drugdicom=$(word 1,$(wildcard $(drugstruct)/i*MRDC*))
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

./figures/$(subject)_AUD_P_M.png:  placebodti/func/auditory/run_01/realign.dat 
	cd placebodti/func/auditory/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, motion('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_AUD_P_M', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_CON_D_M.png:  drug/func/connectivity/run_01/realign.dat 
	cd drug/func/connectivity/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, motion('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_CON_D_M', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_CON_P_M.png:  placebodti/func/connectivity/run_01/realign.dat 
	cd placebodti/func/connectivity/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, motion('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_CON_P_M', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_MOT_D_M.png:  drug/func/motor/run_01/realign.dat 
	cd drug/func/motor/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, motion('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_MOT_D_M', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_MOT_P_M.png:  placebodti/func/motor/run_01/realign.dat 
	cd placebodti/func/motor/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, motion('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_MOT_P_M', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_TAC_D_M.png:  drug/func/tactile/run_01/realign.dat  
	cd drug/func/tactile/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, motion('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_TAC_D_M', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_TAC_P_M.png:  placebodti/func/tactile/run_01/realign.dat 
	cd placebodti/func/tactile/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, motion('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_TAC_P_M', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_VIS_D_M.png:  drug/func/visual/run_01/realign.dat 
	cd drug/func/visual/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, motion('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_VIS_D_M', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_VIS_P_M.png:  placebodti/func/visual/run_01/realign.dat 
	cd placebodti/func/visual/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, motion('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_VIS_P_M', '$<'), catch, 'Error running figs', end; exit"

# Second step is to get the raw BOLD images for each subject.  There is a raw
# BOLD image for placebo and drug in auditory, connectivity, motor, tactile and visual
# for each subject.  This is located in (drug_status)/func/(group)/run_01.  I run the
# matlab script "bold" to save these images as (subjectid)_(group)_D/P_R_001.png.

pic: ./figures/$(subject)_AUD_D_R_001.jpg

./figures/$(subject)_AUD_D_R_001.jpg:  drug/func/auditory/run_01/run_01.nii 
	cd drug/func/auditory/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, bold('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_AUD_D_R', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_AUD_P_R_001.jpg:  placebodti/func/auditory/run_01/run_01.nii 
	cd placebodti/func/auditory/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, bold('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_AUD_P_R', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_CON_D_R_001.jpg:  drug/func/connectivity/run_01/run_01.nii 
	cd drug/func/connectivity/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, bold('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_CON_D_R', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_CON_P_R_001.jpg:  placebodti/func/connectivity/run_01/run_01.nii 
	cd placebodti/func/connectivity/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, bold('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_CON_P_R', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_MOT_D_R_001.jpg:  drug/func/motor/run_01/run_01.nii 
	cd drug/func/motor/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, bold('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_MOT_D_R', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_MOT_P_R_001.jpg:  placebodti/func/motor/run_01/run_01.nii 
	cd placebodti/func/motor/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, bold('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_MOT_P_R', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_TAC_D_R_001.jpg:  drug/func/tactile/run_01/run_01.nii 
	cd drug/func/tactile/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, bold('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_TAC_D_R', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_TAC_P_R_001.jpg:  placebodti/func/tactile/run_01/run_01.nii 
	cd placebodti/func/tactile/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, bold('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_TAC_P_R', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_VIS_D_R_001.jpg:  drug/func/visual/run_01/run_01.nii 
	cd drug/func/visual/run_01/ ; \
	matlab -nosplash -nodesktop -r "try, bold('$(subject)', '/nfs/tpolk/mind/subjects/$(subject)/figures/$(subject)_VIS_D_R', '$<'), catch, 'Error running figs', end; exit"

./figures/$(subject)_VIS_P_R_001.jpg:  placebodti/func/visual/run_01/run_01.nii 
	cd placebodti/func/visual/run_01/ ; \
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

