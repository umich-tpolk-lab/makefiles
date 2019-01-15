SHELL := /bin/bash

# Note that the symbolic links to this makefile are in /nfs/tpolk/mind/freesurfer/func/?mind????
# It will normally be called recursively from the makefile in the func directory above it

# Make sure the Freesurfer subjects directory is set correctly
export SUBJECTS_DIR=/nfs/tpolk/mind/freesurfer

# get subject id from the path
subject=$(shell pwd|egrep -o '[dp]mind[oy][0-9][0-9][0-9]')
stripsubject=$(shell pwd|egrep -o 'mind[oy][0-9][0-9][0-9]')

.PHONY: all distinct first6 last4 

all: saved50 saved100 saved200 saved300 saved400 saved600 saved1000 saved2000 saved5000 saved10000 
# all: saved50 saved100 saved200 saved300 saved400 saved600 saved1000 saved2000 saved5000 saved10000 allhcorr allclassify distinctgaba
first6: distinct50 distinct100 distinct200 distinct300 distinct400 distinct600
last4: distinct1000 distinct2000 distinct5000 distinct10000 
distinct: distinct50 distinct100 distinct200 distinct300 distinct400 distinct600 distinct1000 distinct2000 distinct5000 distinct10000 distinctgaba


.PHONY: saved300 saved_aud300 saved_vis300 saved_mot300 saved_tact300

saved300: saved_aud300 saved_vis300 saved_mot300
saved_aud300: saved_aud_sm_sm300 saved_aud_sm_unsm300 saved_aud_unsm_unsm300 saved_aud_sm_sm300_NoOverlap saved_aud_sm_unsm300_NoOverlap saved_aud_unsm_unsm300_NoOverlap
saved_vis300: saved_vis_sm_sm300 saved_vis_sm_unsm300 saved_vis_unsm_unsm300 saved_vis_sm_sm300_NoOverlap saved_vis_sm_unsm300_NoOverlap saved_vis_unsm_unsm300_NoOverlap
saved_mot300: saved_mot_sm_sm300 saved_mot_sm_unsm300 saved_mot_unsm_unsm300 saved_mot_sm_sm300_NoOverlap saved_mot_sm_unsm300_NoOverlap saved_mot_unsm_unsm300_NoOverlap
saved_tact300: saved_tact_sm_sm300 saved_tact_sm_unsm300 saved_tact_unsm_unsm300 saved_tact_sm_sm300_NoOverlap saved_tact_sm_unsm300_NoOverlap saved_tact_unsm_unsm300_NoOverlap

saved_aud_sm_sm300: auditory/distinct_sm_sm300.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_sm300.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_sm300

saved_aud_sm_unsm300: auditory/distinct_sm_unsm300.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_unsm300.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_unsm300

saved_aud_unsm_unsm300: auditory/distinct_unsm_unsm300.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_unsm_unsm300.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_unsm_unsm300

saved_vis_sm_sm300: visual/distinct_sm_sm300.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_sm300.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_sm300

saved_vis_sm_unsm300: visual/distinct_sm_unsm300.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_unsm300.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_unsm300

saved_vis_unsm_unsm300: visual/distinct_unsm_unsm300.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_unsm_unsm300.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_unsm_unsm300

saved_mot_sm_sm300: motor/distinct_sm_sm300.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_sm300.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_sm300

saved_mot_sm_unsm300: motor/distinct_sm_unsm300.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_unsm300.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_unsm300

saved_mot_unsm_unsm300: motor/distinct_unsm_unsm300.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_unsm_unsm300.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_unsm_unsm300

saved_tact_sm_sm300: tactile/distinct_sm_sm300.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_sm300.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_sm300

saved_tact_sm_unsm300: tactile/distinct_sm_unsm300.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_unsm300.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_unsm300

saved_tact_unsm_unsm300: tactile/distinct_unsm_unsm300.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_unsm_unsm300.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_unsm_unsm300

saved_aud_sm_sm300_NoOverlap: auditory/distinct_sm_sm300_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_sm300_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_sm300_NoOverlap

saved_aud_sm_unsm300_NoOverlap: auditory/distinct_sm_unsm300_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_unsm300_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_unsm300_NoOverlap

saved_aud_unsm_unsm300_NoOverlap: auditory/distinct_unsm_unsm300_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_unsm_unsm300_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_unsm_unsm300_NoOverlap

saved_vis_sm_sm300_NoOverlap: visual/distinct_sm_sm300_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_sm300_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_sm300_NoOverlap

saved_vis_sm_unsm300_NoOverlap: visual/distinct_sm_unsm300_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_unsm300_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_unsm300_NoOverlap

saved_vis_unsm_unsm300_NoOverlap: visual/distinct_unsm_unsm300_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_unsm_unsm300_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_unsm_unsm300_NoOverlap

saved_mot_sm_sm300_NoOverlap: motor/distinct_sm_sm300_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_sm300_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_sm300_NoOverlap

saved_mot_sm_unsm300_NoOverlap: motor/distinct_sm_unsm300_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_unsm300_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_unsm300_NoOverlap

saved_mot_unsm_unsm300_NoOverlap: motor/distinct_unsm_unsm300_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_unsm_unsm300_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_unsm_unsm300_NoOverlap

saved_tact_sm_sm300_NoOverlap: tactile/distinct_sm_sm300_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_sm300_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_sm300_NoOverlap

saved_tact_sm_unsm300_NoOverlap: tactile/distinct_sm_unsm300_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_unsm300_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_unsm300_NoOverlap

saved_tact_unsm_unsm300_NoOverlap: tactile/distinct_unsm_unsm300_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_unsm_unsm300_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_unsm_unsm300_NoOverlap


.PHONY: distinct300 distinct-aud300 distinct-vis300 distinct-mot300 distinct-tact300
.PHONY: distinct-aud_sm_sm300 distinct-aud_sm_unsm300 distinct-aud_unsm_unsm300 distinct-aud_sm_sm300_NoOverlap distinct-aud_sm_unsm300_NoOverlap distinct-aud_unsm_unsm300_NoOverlap
.PHONY: distinct-vis_sm_sm300 distinct-vis_sm_unsm300 distinct-vis_unsm_unsm300 distinct-vis_sm_sm300_NoOverlap distinct-vis_sm_unsm300_NoOverlap distinct-vis_unsm_unsm300_NoOverlap
.PHONY: distinct-mot_sm_sm300 distinct-mot_sm_unsm300 distinct-mot_unsm_unsm300 distinct-mot_sm_sm300_NoOverlap distinct-mot_sm_unsm300_NoOverlap distinct-mot_unsm_unsm300_NoOverlap
.PHONY: distinct-tact_sm_sm300 distinct-tact_sm_unsm300 distinct-tact_unsm_unsm300 distinct-tact_sm_sm300_NoOverlap distinct-tact_sm_unsm300_NoOverlap distinct-tact_unsm_unsm300_NoOverlap

distinct300: distinct-aud300 distinct-vis300 distinct-mot300
distinct-aud300: distinct-aud_sm_sm300 distinct-aud_sm_unsm300 distinct-aud_unsm_unsm300 distinct-aud_sm_sm300_NoOverlap distinct-aud_sm_unsm300 distinct-aud_unsm_unsm300_NoOverlap
distinct-vis300: distinct-vis_sm_sm300 distinct-vis_sm_unsm300 distinct-vis_unsm_unsm300 distinct-vis_sm_sm300_NoOverlap distinct-vis_sm_unsm300 distinct-vis_unsm_unsm300_NoOverlap
distinct-mot300: distinct-mot_sm_sm300 distinct-mot_sm_unsm300 distinct-mot_unsm_unsm300 distinct-mot_sm_sm300_NoOverlap distinct-mot_sm_unsm300 distinct-mot_unsm_unsm300_NoOverlap
distinct-tact300: distinct-tact_sm_sm300 distinct-tact_sm_unsm300 distinct-tact_unsm_unsm300 distinct-tact_sm_sm300_NoOverlap distinct-tact_sm_unsm300 distinct-tact_unsm_unsm300_NoOverlap

distinctgaba:distinct-audgaba distinct-visgaba distinct-motgaba

distinct-aud_sm_sm300: auditory/distinct_sm_sm300.mat
distinct-aud_sm_unsm300: auditory/distinct_sm_unsm300.mat
distinct-aud_unsm_unsm300: auditory/distinct_unsm_unsm300.mat
distinct-aud_sm_sm300_NoOverlap: auditory/distinct_sm_sm300_NoOverlap.mat
distinct-aud_sm_unsm300_NoOverlap: auditory/distinct_sm_unsm300_NoOverlap.mat
distinct-aud_unsm_unsm300_NoOverlap: auditory/distinct_unsm_unsm300_NoOverlap.mat

distinct-vis_sm_sm300: visual/distinct_sm_sm300.mat
distinct-vis_sm_unsm300: visual/distinct_sm_unsm300.mat
distinct-vis_unsm_unsm300: visual/distinct_unsm_unsm300.mat
distinct-vis_sm_sm300_NoOverlap: visual/distinct_sm_sm300_NoOverlap.mat
distinct-vis_sm_unsm300_NoOverlap: visual/distinct_sm_unsm300_NoOverlap.mat
distinct-vis_unsm_unsm300_NoOverlap: visual/distinct_unsm_unsm300_NoOverlap.mat

distinct-mot_sm_sm300: motor/distinct_sm_sm300.mat
distinct-mot_sm_unsm300: motor/distinct_sm_unsm300.mat
distinct-mot_unsm_unsm300: motor/distinct_unsm_unsm300.mat
distinct-mot_sm_sm300_NoOverlap: motor/distinct_sm_sm300_NoOverlap.mat
distinct-mot_sm_unsm300_NoOverlap: motor/distinct_sm_unsm300_NoOverlap.mat
distinct-mot_unsm_unsm300_NoOverlap: motor/distinct_unsm_unsm300_NoOverlap.mat

distinct-tact_sm_sm300: tactile/distinct_sm_sm300.mat
distinct-tact_sm_unsm300: tactile/distinct_sm_unsm300.mat
distinct-tact_unsm_unsm300: tactile/distinct_unsm_unsm300.mat
distinct-tact_sm_sm300_NoOverlap: tactile/distinct_sm_sm300.mat
distinct-tact_sm_unsm300_NoOverlap: tactile/distinct_sm_unsm300.mat
distinct-tact_unsm_unsm300_NoOverlap: tactile/distinct_unsm_unsm300.mat

.PHONY: distinctgaba distinct-audgaba distinct-audgabalh distinct-audgabarh gaba-preproc preprocgabalh preprocgabarh 
.PHONY: distinct-visgaba distinct-visgabalh distinct-visgabarh
.PHONY: distinct-motgaba distinct-motgabalh distinct-motgabarh
.PHONY: distinct-tactgaba distinct-tactgabalh distinct-tactgabarh


distinct-audgaba:gaba-preproc distinct-audgabalh distinct-audgabarh
distinct-audgabalh: auditory/musicspeech.sm5.12blks.lh/distinct_gabalh.mat
distinct-audgabarh: auditory/musicspeech.sm5.12blks.rh/distinct_gabarh.mat

distinct-visgaba:gaba-preproc distinct-visgabalh distinct-visgabarh
distinct-visgabalh: visual/houseface.sm5.12blks.lh/distinct_gabalh.mat
distinct-visgabarh: visual/houseface.sm5.12blks.rh/distinct_gabarh.mat

distinct-motgaba:gaba-preproc distinct-motgabalh distinct-motgabarh
distinct-motgabalh: motor/rightleftm.sm5.12blks.lh/distinct_gabalh.mat
distinct-motgabarh: motor/rightleftm.sm5.12blks.rh/distinct_gabarh.mat

distinct-tactgaba:gaba-preproc distinct-tactgabalh distinct-tactgabarh
distinct-tactgabalh: tactile/rightleftt.sm5.12blks.lh/distinct_gabalh.mat
distinct-tactgabarh: tactile/rightleftt.sm5.12blks.rh/distinct_gabarh.mat

gaba-preproc:preprocgabalh preprocgabarh
preprocgabalh: auditory/preproclh visual/preproclh motor/preproclh
preprocgabarh: auditory/preprocrh visual/preprocrh motor/preprocrh

auditory/preproclh:/nfs/tpolk/mind/subjects/$(stripsubject)/mrs/spectro/leftauditory/mask.nii
	bbregister --mov /nfs/tpolk/mind/subjects/$(stripsubject)/mrs/anatomy/t1spgr_156sl/t1spgr_156sl.nii --s fsaverage --t1 --init-coreg --reg auditory/gabaregister.dat;\
	mri_vol2vol --reg auditory/gabaregister.dat --mov /nfs/tpolk/mind/subjects/$(stripsubject)/mrs/spectro/leftauditory/mask.nii --fstarg --o auditory/musicspeech.sm5.12blks.lh/gabaleftmask.mgh --interp nearest;\
	mri_vol2surf --src auditory/musicspeech.sm5.12blks.lh/gabaleftmask.mgh --out auditory/musicspeech.sm5.12blks.lh/gabaleftsurf.nii --srcreg auditory/gabaregister.dat --hemi lh ;\
	touch auditory/preproclh

auditory/preprocrh:/nfs/tpolk/mind/subjects/$(stripsubject)/mrs/spectro/rightauditory/mask.nii
	bbregister --mov /nfs/tpolk/mind/subjects/$(stripsubject)/mrs/anatomy/t1spgr_156sl/t1spgr_156sl.nii --s fsaverage --t1 --init-coreg --reg auditory/gabaregister.dat ;\
	mri_vol2vol --reg auditory/gabaregister.dat --mov /nfs/tpolk/mind/subjects/$(stripsubject)/mrs/spectro/rightauditory/mask.nii --fstarg --o auditory/musicspeech.sm5.12blks.rh/gabarightmask.mgh --interp nearest ;\
	mri_vol2surf --src auditory/musicspeech.sm5.12blks.rh/gabarightmask.mgh --out auditory/musicspeech.sm5.12blks.rh/gabarightsurf.nii --srcreg auditory/gabaregister.dat --hemi rh ;\
	touch auditory/preprocrh

auditory/musicspeech.sm5.12blks.lh/distinct_gabalh.mat:auditory/preproclh
	cd auditory/musicspeech.sm5.12blks.lh ;\
	matlab -nosplash -nodesktop -r "try, applygabamask('beta.nii.gz','gabaleftsurf.nii','distinct_gabalh.mat'), catch, 'Error running applygabamasklh', end; exit" ;\

auditory/musicspeech.sm5.12blks.rh/distinct_gabarh.mat:auditory/preprocrh
	cd auditory/musicspeech.sm5.12blks.rh ;\
	matlab -nosplash -nodesktop -r "try, applygabamask('beta.nii.gz','gabarightsurf.nii','distinct_gabarh.mat'), catch, 'Error running applygabamaskrh', end; exit" ;\


visual/preproclh:/nfs/tpolk/mind/subjects/$(stripsubject)/mrs/spectro/leftventrovisual/mask.nii
	bbregister --mov /nfs/tpolk/mind/subjects/$(stripsubject)/mrs/anatomy/t1spgr_156sl/t1spgr_156sl.nii --s fsaverage --t1 --init-coreg --reg visual/gabaregister.dat ;\
	mri_vol2vol --reg visual/gabaregister.dat --mov /nfs/tpolk/mind/subjects/$(stripsubject)/mrs/spectro/leftventrovisual/mask.nii --fstarg --o visual/houseface.sm5.12blks.lh/gabaleftmask.mgh --interp nearest ;\
	mri_vol2surf --src visual/houseface.sm5.12blks.lh/gabaleftmask.mgh --out visual/houseface.sm5.12blks.lh/gabaleftsurf.nii --srcreg visual/gabaregister.dat --hemi lh ;\
	touch visual/preproclh

visual/preprocrh:/nfs/tpolk/mind/subjects/$(stripsubject)/mrs/spectro/rightventrovisual/mask.nii
	bbregister --mov /nfs/tpolk/mind/subjects/$(stripsubject)/mrs/anatomy/t1spgr_156sl/t1spgr_156sl.nii --s fsaverage --t1 --init-coreg --reg visual/gabaregister.dat ;\
	mri_vol2vol --reg visual/gabaregister.dat --mov /nfs/tpolk/mind/subjects/$(stripsubject)/mrs/spectro/rightventrovisual/mask.nii --fstarg --o visual/houseface.sm5.12blks.rh/gabarightmask.mgh --interp nearest ;\
	mri_vol2surf --src visual/houseface.sm5.12blks.rh/gabarightmask.mgh --out visual/houseface.sm5.12blks.rh/gabarightsurf.nii --srcreg visual/gabaregister.dat --hemi rh ;\
	touch visual/preprocrh

visual/houseface.sm5.12blks.lh/distinct_gabalh.mat:visual/preproclh
	cd visual/houseface.sm5.12blks.lh ;\
	matlab -nosplash -nodesktop -r "try, applygabamask('beta.nii.gz','gabaleftsurf.nii','distinct_gabalh.mat'), catch, 'Error running applygabamasklh', end; exit"

visual/houseface.sm5.12blks.rh/distinct_gabarh.mat:visual/preprocrh
	cd visual/houseface.sm5.12blks.rh ;\
	matlab -nosplash -nodesktop -r "try, applygabamask('beta.nii.gz','gabarightsurf.nii','distinct_gabarh.mat'), catch, 'Error running applygabamaskrh', end; exit"


motor/preproclh:/nfs/tpolk/mind/subjects/$(stripsubject)/mrs/spectro/leftsensorymotor/mask.nii
	bbregister --mov /nfs/tpolk/mind/subjects/$(stripsubject)/mrs/anatomy/t1spgr_156sl/t1spgr_156sl.nii --s fsaverage --t1 --init-coreg --reg motor/gabaregister.dat ;\
	mri_vol2vol --reg motor/gabaregister.dat --mov /nfs/tpolk/mind/subjects/$(stripsubject)/mrs/spectro/leftsensorymotor/mask.nii --fstarg --o motor/rightleftm.sm5.12blks.lh/gabaleftmask.mgh --interp nearest ;\
	mri_vol2surf --src motor/rightleftm.sm5.12blks.lh/gabaleftmask.mgh --out motor/rightleftm.sm5.12blks.lh/gabaleftsurf.nii --srcreg motor/gabaregister.dat --hemi lh ;\
	touch motor/preproclh

motor/preprocrh:/nfs/tpolk/mind/subjects/$(stripsubject)/mrs/spectro/rightsensorymotor/mask.nii
	bbregister --mov /nfs/tpolk/mind/subjects/$(stripsubject)/mrs/anatomy/t1spgr_156sl/t1spgr_156sl.nii --s fsaverage --t1 --init-coreg --reg motor/gabaregister.dat ;\
	mri_vol2vol --reg motor/gabaregister.dat --mov /nfs/tpolk/mind/subjects/$(stripsubject)/mrs/spectro/rightsensorymotor/mask.nii --fstarg --o motor/rightleftm.sm5.12blks.rh/gabarightmask.mgh --interp nearest ;\
	mri_vol2surf --src motor/rightleftm.sm5.12blks.rh/gabarightmask.mgh --out motor/rightleftm.sm5.12blks.rh/gabarightsurf.nii --srcreg motor/gabaregister.dat --hemi rh ;\
	touch motor/preprocrh

motor/rightleftm.sm5.12blks.lh/distinct_gabalh.mat:motor/preproclh
	cd motor/rightleftm.sm5.12blks.lh ;\
	matlab -nosplash -nodesktop -r "try, applygabamask('beta.nii.gz','gabaleftsurf.nii','distinct_gabalh.mat'), catch, 'Error running applygabamasklh', end; exit"

motor/rightleftm.sm5.12blks.rh/distinct_gabarh.mat:motor/preprocrh
	cd motor/rightleftm.sm5.12blks.rh ;\
	matlab -nosplash -nodesktop -r "try, applygabamask('beta.nii.gz','gabarightsurf.nii','distinct_gabarh.mat'), catch, 'Error running applygabamaskrh', end; exit"


tactile/preproclh:/nfs/tpolk/mind/subjects/$(stripsubject)/mrs/spectro/leftsensorymotor/mask.nii
	bbregister --mov /nfs/tpolk/mind/subjects/$(stripsubject)/mrs/anatomy/t1spgr_156sl/t1spgr_156sl.nii --s fsaverage --t1 --init-coreg --reg tactile/gabaregister.dat ;\
	mri_vol2vol --reg tactile/gabaregister.dat --mov /nfs/tpolk/mind/subjects/$(stripsubject)/mrs/spectro/leftsensorymotor/mask.nii --fstarg --o tactile/rightleftt.sm5.12blks.lh/gabaleftmask.mgh --interp nearest ;\
	mri_vol2surf --src tactile/rightleftt.sm5.12blks.lh/gabaleftmask.mgh --out tactile/rightleftt.sm5.12blks.lh/gabaleftsurf.nii --srcreg tactile/gabaregister.dat --hemi lh ;\
	touch tactile/preproclh

tactile/preprocrh:/nfs/tpolk/mind/subjects/$(stripsubject)/mrs/spectro/rightsensorymotor/mask.nii
	bbregister --mov /nfs/tpolk/mind/subjects/$(stripsubject)/mrs/anatomy/t1spgr_156sl/t1spgr_156sl.nii --s fsaverage --t1 --init-coreg --reg tactile/gabaregister.dat ;\
	mri_vol2vol --reg tactile/gabaregister.dat --mov /nfs/tpolk/mind/subjects/$(stripsubject)/mrs/spectro/rightsensorymotor/mask.nii --fstarg --o tactile/rightleftt.sm5.12blks.rh/gabarightmask.mgh --interp nearest ;\
	mri_vol2surf --src tactile/rightleftt.sm5.12blks.rh/gabarightmask.mgh --out tactile/rightleftt.sm5.12blks.rh/gabarightsurf.nii --srcreg tactile/gabaregister.dat --hemi rh ;\
	touch tactile/preprocrh

tactile/rightleftt.sm5.12blks.lh/distinct_gabalh.mat:tactile/preproclh
	cd tactile/rightleftt.sm5.12blks.lh ;\
	matlab -nosplash -nodesktop -r "try, applygabamask('beta.nii.gz','gabaleftsurf.nii','distinct_gabalh.mat'), catch, 'Error running applygabamasklh', end; exit"

tactile/rightleftt.sm5.12blks.rh/distinct_gabarh.mat:tactile/preprocrh
	cd tactile/rightleftt.sm5.12blks.rh ;\
	matlab -nosplash -nodesktop -r "try, applygabamask('beta.nii.gz','gabarightsurf.nii','distinct_gabarh.mat'), catch, 'Error running applygabamaskrh', end; exit"




auditory/distinct_sm_sm300.mat: auditory/funcmasked_sm_sm300.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm300.mat','distinct_sm_sm300.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_sm300.mat: visual/funcmasked_sm_sm300.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm300.mat','distinct_sm_sm300.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_sm300.mat: motor/funcmasked_sm_sm300.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm300.mat','distinct_sm_sm300.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_sm300.mat: tactile/funcmasked_sm_sm300.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm300.mat','distinct_sm_sm300.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_unsm300.mat: auditory/funcmasked_sm_unsm300.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm300.mat','distinct_sm_unsm300.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_unsm300.mat: visual/funcmasked_sm_unsm300.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm300.mat','distinct_sm_unsm300.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_unsm300.mat: motor/funcmasked_sm_unsm300.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm300.mat','distinct_sm_unsm300.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_unsm300.mat: tactile/funcmasked_sm_unsm300.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm300.mat','distinct_sm_unsm300.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_unsm_unsm300.mat: auditory/funcmasked_unsm_unsm300.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm300.mat','distinct_unsm_unsm300.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_unsm_unsm300.mat: visual/funcmasked_unsm_unsm300.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm300.mat','distinct_unsm_unsm300.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_unsm_unsm300.mat: motor/funcmasked_unsm_unsm300.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm300.mat','distinct_unsm_unsm300.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_unsm_unsm300.mat: tactile/funcmasked_unsm_unsm300.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm300.mat','distinct_unsm_unsm300.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_sm300_NoOverlap.mat: auditory/funcmasked_sm_sm300_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm300_NoOverlap.mat','distinct_sm_sm300_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_sm300_NoOverlap.mat: visual/funcmasked_sm_sm300_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm300_NoOverlap.mat','distinct_sm_sm300_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_sm300_NoOverlap.mat: motor/funcmasked_sm_sm300_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm300_NoOverlap.mat','distinct_sm_sm300_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_sm300_NoOverlap.mat: tactile/funcmasked_sm_sm300_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm300_NoOverlap.mat','distinct_sm_sm300_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_unsm300_NoOverlap.mat: auditory/funcmasked_sm_unsm300_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm300_NoOverlap.mat','distinct_sm_unsm300_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_unsm300_NoOverlap.mat: visual/funcmasked_sm_unsm300_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm300_NoOverlap.mat','distinct_sm_unsm300_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_unsm300_NoOverlap.mat: motor/funcmasked_sm_unsm300_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm300_NoOverlap.mat','distinct_sm_unsm300_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_unsm300_NoOverlap.mat: tactile/funcmasked_sm_unsm300_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm300_NoOverlap.mat','distinct_sm_unsm300_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_unsm_unsm300_NoOverlap.mat: auditory/funcmasked_unsm_unsm300_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm300_NoOverlap.mat','distinct_unsm_unsm300_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_unsm_unsm300_NoOverlap.mat: visual/funcmasked_unsm_unsm300_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm300_NoOverlap.mat','distinct_unsm_unsm300_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_unsm_unsm300_NoOverlap.mat: motor/funcmasked_unsm_unsm300_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm300_NoOverlap.mat','distinct_unsm_unsm300_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_unsm_unsm300_NoOverlap.mat: tactile/funcmasked_unsm_unsm300_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm300_NoOverlap.mat','distinct_unsm_unsm300_NoOverlap.mat'), catch, 'Error running corridff', end; exit"


.PHONY: allfuncmasks

allfuncmasks: auditory/funcmasked_sm_sm50.mat auditory/funcmasked_sm_sm100.mat auditory/funcmasked_sm_sm200.mat auditory/funcmasked_sm_sm300.mat auditory/funcmasked_sm_sm400.mat auditory/funcmasked_sm_sm600.mat auditory/funcmasked_sm_sm1000.mat auditory/funcmasked_sm_sm2000.mat auditory/funcmasked_sm_sm5000.mat auditory/funcmasked_sm_sm10000.mat auditory/funcmasked_sm_sm100_NoOverlap.mat auditory/funcmasked_sm_sm200_NoOverlap.mat auditory/funcmasked_sm_sm300_NoOverlap.mat auditory/funcmasked_sm_sm400_NoOverlap.mat auditory/funcmasked_sm_sm600_NoOverlap.mat auditory/funcmasked_sm_sm1000_NoOverlap.mat auditory/funcmasked_sm_sm2000_NoOverlap.mat auditory/funcmasked_sm_sm5000_NoOverlap.mat auditory/funcmasked_sm_sm10000_NoOverlap.mat 


auditory/funcmasked_sm_sm300.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemSm12conds.mat auditory/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_unsm300.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_unsm_unsm300.mat: auditory/LeftHemUnsm2conds.mat auditory/RightHemUnsm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_sm300.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemSm12conds.mat motor/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_unsm300.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_unsm_unsm300.mat: motor/LeftHemUnsm2conds.mat motor/RightHemUnsm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_sm300.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemSm12conds.mat visual/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_unsm300.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_unsm_unsm300.mat: visual/LeftHemUnsm2conds.mat visual/RightHemUnsm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_sm300.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemSm12conds.mat tactile/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_unsm300.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_unsm_unsm300.mat: tactile/LeftHemUnsm2conds.mat tactile/RightHemUnsm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_sm300_NoOverlap.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemSm12conds.mat auditory/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(200,300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_unsm300_NoOverlap.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(200,300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_unsm_unsm300_NoOverlap.mat: auditory/LeftHemUnsm2conds.mat auditory/RightHemUnsm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(200,300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_sm300_NoOverlap.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemSm12conds.mat motor/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(200,300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_unsm300_NoOverlap.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(200,300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_unsm_unsm300_NoOverlap.mat: motor/LeftHemUnsm2conds.mat motor/RightHemUnsm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(200,300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_sm300_NoOverlap.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemSm12conds.mat visual/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(200,300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_unsm300_NoOverlap.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(200,300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_unsm_unsm300_NoOverlap.mat: visual/LeftHemUnsm2conds.mat visual/RightHemUnsm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(200,300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_sm300_NoOverlap.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemSm12conds.mat tactile/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(200,300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_unsm300_NoOverlap.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(200,300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_unsm_unsm300_NoOverlap.mat: tactile/LeftHemUnsm2conds.mat tactile/RightHemUnsm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(200,300,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

.PHONY: saved200 saved_aud200 saved_vis200 saved_mot200 saved_tact200

saved200: saved_aud200 saved_vis200 saved_mot200
saved_aud200: saved_aud_sm_sm200 saved_aud_sm_unsm200 saved_aud_unsm_unsm200 saved_aud_sm_sm200_NoOverlap saved_aud_sm_unsm200_NoOverlap saved_aud_unsm_unsm200_NoOverlap
saved_vis200: saved_vis_sm_sm200 saved_vis_sm_unsm200 saved_vis_unsm_unsm200 saved_vis_sm_sm200_NoOverlap saved_vis_sm_unsm200_NoOverlap saved_vis_unsm_unsm200_NoOverlap
saved_mot200: saved_mot_sm_sm200 saved_mot_sm_unsm200 saved_mot_unsm_unsm200 saved_mot_sm_sm200_NoOverlap saved_mot_sm_unsm200_NoOverlap saved_mot_unsm_unsm200_NoOverlap
saved_tact200: saved_tact_sm_sm200 saved_tact_sm_unsm200 saved_tact_unsm_unsm200 saved_tact_sm_sm200_NoOverlap saved_tact_sm_unsm200_NoOverlap saved_tact_unsm_unsm200_NoOverlap

saved_aud_sm_sm200: auditory/distinct_sm_sm200.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_sm200.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_sm200

saved_aud_sm_unsm200: auditory/distinct_sm_unsm200.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_unsm200.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_unsm200

saved_aud_unsm_unsm200: auditory/distinct_unsm_unsm200.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_unsm_unsm200.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_unsm_unsm200

saved_vis_sm_sm200: visual/distinct_sm_sm200.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_sm200.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_sm200

saved_vis_sm_unsm200: visual/distinct_sm_unsm200.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_unsm200.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_unsm200

saved_vis_unsm_unsm200: visual/distinct_unsm_unsm200.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_unsm_unsm200.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_unsm_unsm200

saved_mot_sm_sm200: motor/distinct_sm_sm200.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_sm200.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_sm200

saved_mot_sm_unsm200: motor/distinct_sm_unsm200.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_unsm200.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_unsm200

saved_mot_unsm_unsm200: motor/distinct_unsm_unsm200.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_unsm_unsm200.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_unsm_unsm200

saved_tact_sm_sm200: tactile/distinct_sm_sm200.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_sm200.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_sm200

saved_tact_sm_unsm200: tactile/distinct_sm_unsm200.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_unsm200.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_unsm200

saved_tact_unsm_unsm200: tactile/distinct_unsm_unsm200.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_unsm_unsm200.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_unsm_unsm200

saved_aud_sm_sm200_NoOverlap: auditory/distinct_sm_sm200_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_sm200_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_sm200_NoOverlap

saved_aud_sm_unsm200_NoOverlap: auditory/distinct_sm_unsm200_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_unsm200_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_unsm200_NoOverlap

saved_aud_unsm_unsm200_NoOverlap: auditory/distinct_unsm_unsm200_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_unsm_unsm200_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_unsm_unsm200_NoOverlap

saved_vis_sm_sm200_NoOverlap: visual/distinct_sm_sm200_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_sm200_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_sm200_NoOverlap

saved_vis_sm_unsm200_NoOverlap: visual/distinct_sm_unsm200_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_unsm200_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_unsm200_NoOverlap

saved_vis_unsm_unsm200_NoOverlap: visual/distinct_unsm_unsm200_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_unsm_unsm200_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_unsm_unsm200_NoOverlap

saved_mot_sm_sm200_NoOverlap: motor/distinct_sm_sm200_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_sm200_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_sm200_NoOverlap

saved_mot_sm_unsm200_NoOverlap: motor/distinct_sm_unsm200_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_unsm200_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_unsm200_NoOverlap

saved_mot_unsm_unsm200_NoOverlap: motor/distinct_unsm_unsm200_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_unsm_unsm200_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_unsm_unsm200_NoOverlap

saved_tact_sm_sm200_NoOverlap: tactile/distinct_sm_sm200_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_sm200_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_sm200_NoOverlap

saved_tact_sm_unsm200_NoOverlap: tactile/distinct_sm_unsm200_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_unsm200_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_unsm200_NoOverlap

saved_tact_unsm_unsm200_NoOverlap: tactile/distinct_unsm_unsm200_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_unsm_unsm200_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_unsm_unsm200_NoOverlap


.PHONY: distinct200 distinct-aud200 distinct-vis200 distinct-mot200 distinct-tact200
.PHONY: distinct-aud_sm_sm200 distinct-aud_sm_unsm200 distinct-aud_unsm_unsm200 distinct-aud_sm_sm200_NoOverlap distinct-aud_sm_unsm200_NoOverlap distinct-aud_unsm_unsm200_NoOverlap
.PHONY: distinct-vis_sm_sm200 distinct-vis_sm_unsm200 distinct-vis_unsm_unsm200 distinct-vis_sm_sm200_NoOverlap distinct-vis_sm_unsm200_NoOverlap distinct-vis_unsm_unsm200_NoOverlap
.PHONY: distinct-mot_sm_sm200 distinct-mot_sm_unsm200 distinct-mot_unsm_unsm200 distinct-mot_sm_sm200_NoOverlap distinct-mot_sm_unsm200_NoOverlap distinct-mot_unsm_unsm200_NoOverlap
.PHONY: distinct-tact_sm_sm200 distinct-tact_sm_unsm200 distinct-tact_unsm_unsm200 distinct-tact_sm_sm200_NoOverlap distinct-tact_sm_unsm200_NoOverlap distinct-tact_unsm_unsm200_NoOverlap

distinct200: distinct-aud200 distinct-vis200 distinct-mot200
distinct-aud200: distinct-aud_sm_sm200 distinct-aud_sm_unsm200 distinct-aud_unsm_unsm200 distinct-aud_sm_sm200_NoOverlap distinct-aud_sm_unsm200_NoOverlap distinct-aud_unsm_unsm200_NoOverlap
distinct-vis200: distinct-vis_sm_sm200 distinct-vis_sm_unsm200 distinct-vis_unsm_unsm200 distinct-vis_sm_sm200_NoOverlap distinct-vis_sm_unsm200_NoOverlap distinct-vis_unsm_unsm200_NoOverlap
distinct-mot200: distinct-mot_sm_sm200 distinct-mot_sm_unsm200 distinct-mot_unsm_unsm200 distinct-mot_sm_sm200_NoOverlap distinct-mot_sm_unsm200_NoOverlap distinct-mot_unsm_unsm200_NoOverlap
distinct-tact200: distinct-tact_sm_sm200 distinct-tact_sm_unsm200 distinct-tact_unsm_unsm200 distinct-tact_sm_sm200_NoOverlap distinct-tact_sm_unsm200_NoOverlap distinct-tact_unsm_unsm200_NoOverlap

distinct-aud_sm_sm200: auditory/distinct_sm_sm200.mat
distinct-aud_sm_unsm200: auditory/distinct_sm_unsm200.mat
distinct-aud_unsm_unsm200: auditory/distinct_unsm_unsm200.mat
distinct-aud_sm_sm200_NoOverlap: auditory/distinct_sm_sm200_NoOverlap.mat
distinct-aud_sm_unsm200_NoOverlap: auditory/distinct_sm_unsm200_NoOverlap.mat
distinct-aud_unsm_unsm200_NoOverlap: auditory/distinct_unsm_unsm200_NoOverlap.mat

distinct-vis_sm_sm200: visual/distinct_sm_sm200.mat
distinct-vis_sm_unsm200: visual/distinct_sm_unsm200.mat
distinct-vis_unsm_unsm200: visual/distinct_unsm_unsm200.mat
distinct-vis_sm_sm200_NoOverlap: visual/distinct_sm_sm200_NoOverlap.mat
distinct-vis_sm_unsm200_NoOverlap: visual/distinct_sm_unsm200_NoOverlap.mat
distinct-vis_unsm_unsm200_NoOverlap: visual/distinct_unsm_unsm200_NoOverlap.mat

distinct-mot_sm_sm200: motor/distinct_sm_sm200.mat
distinct-mot_sm_unsm200: motor/distinct_sm_unsm200.mat
distinct-mot_unsm_unsm200: motor/distinct_unsm_unsm200.mat
distinct-mot_sm_sm200_NoOverlap: motor/distinct_sm_sm200_NoOverlap.mat
distinct-mot_sm_unsm200_NoOverlap: motor/distinct_sm_unsm200_NoOverlap.mat
distinct-mot_unsm_unsm200-NoOverlap: motor/distinct_unsm_unsm200_NoOverlap.mat

distinct-tact_sm_sm200: tactile/distinct_sm_sm200.mat
distinct-tact_sm_unsm200: tactile/distinct_sm_unsm200.mat
distinct-tact_unsm_unsm200: tactile/distinct_unsm_unsm200.mat
distinct-tact_sm_sm200_NoOverlap: tactile/distinct_sm_sm200_NoOverlap.mat
distinct-tact_sm_unsm200_NoOverlap: tactile/distinct_sm_unsm200_NoOverlap.mat
distinct-tact_unsm_unsm200_NoOverlap: tactile/distinct_unsm_unsm200_NoOverlap.mat

auditory/distinct_sm_sm200.mat: auditory/funcmasked_sm_sm200.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm200.mat','distinct_sm_sm200.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_sm200.mat: visual/funcmasked_sm_sm200.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm200.mat','distinct_sm_sm200.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_sm200.mat: motor/funcmasked_sm_sm200.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm200.mat','distinct_sm_sm200.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_sm200.mat: tactile/funcmasked_sm_sm200.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm200.mat','distinct_sm_sm200.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_unsm200.mat: auditory/funcmasked_sm_unsm200.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm200.mat','distinct_sm_unsm200.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_unsm200.mat: visual/funcmasked_sm_unsm200.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm200.mat','distinct_sm_unsm200.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_unsm200.mat: motor/funcmasked_sm_unsm200.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm200.mat','distinct_sm_unsm200.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_unsm200.mat: tactile/funcmasked_sm_unsm200.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm200.mat','distinct_sm_unsm200.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_unsm_unsm200.mat: auditory/funcmasked_unsm_unsm200.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm200.mat','distinct_unsm_unsm200.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_unsm_unsm200.mat: visual/funcmasked_unsm_unsm200.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm200.mat','distinct_unsm_unsm200.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_unsm_unsm200.mat: motor/funcmasked_unsm_unsm200.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm200.mat','distinct_unsm_unsm200.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_unsm_unsm200.mat: tactile/funcmasked_unsm_unsm200.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm200.mat','distinct_unsm_unsm200.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_sm200_NoOverlap.mat: auditory/funcmasked_sm_sm200_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm200_NoOverlap.mat','distinct_sm_sm200_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_sm200_NoOverlap.mat: visual/funcmasked_sm_sm200_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm200_NoOverlap.mat','distinct_sm_sm200_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_sm200_NoOverlap.mat: motor/funcmasked_sm_sm200_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm200_NoOverlap.mat','distinct_sm_sm200_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_sm200_NoOverlap.mat: tactile/funcmasked_sm_sm200_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm200_NoOverlap.mat','distinct_sm_sm200_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_unsm200_NoOverlap.mat: auditory/funcmasked_sm_unsm200_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm200_NoOverlap.mat','distinct_sm_unsm200_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_unsm200_NoOverlap.mat: visual/funcmasked_sm_unsm200_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm200_NoOverlap.mat','distinct_sm_unsm200_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_unsm200_NoOverlap.mat: motor/funcmasked_sm_unsm200_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm200_NoOverlap.mat','distinct_sm_unsm200_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_unsm200_NoOverlap.mat: tactile/funcmasked_sm_unsm200_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm200_NoOverlap.mat','distinct_sm_unsm200_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_unsm_unsm200_NoOverlap.mat: auditory/funcmasked_unsm_unsm200_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm200_NoOverlap.mat','distinct_unsm_unsm200_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_unsm_unsm200_NoOverlap.mat: visual/funcmasked_unsm_unsm200_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm200_NoOverlap.mat','distinct_unsm_unsm200_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_unsm_unsm200_NoOverlap.mat: motor/funcmasked_unsm_unsm200_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm200_NoOverlap.mat','distinct_unsm_unsm200_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_unsm_unsm200_NoOverlap.mat: tactile/funcmasked_unsm_unsm200_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm200_NoOverlap.mat','distinct_unsm_unsm200_NoOverlap.mat'), catch, 'Error running corridff', end; exit"


auditory/funcmasked_sm_sm200.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemSm12conds.mat auditory/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_unsm200.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_unsm_unsm200.mat: auditory/LeftHemUnsm2conds.mat auditory/RightHemUnsm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_sm200.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemSm12conds.mat motor/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_unsm200.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_unsm_unsm200.mat: motor/LeftHemUnsm2conds.mat motor/RightHemUnsm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_sm200.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemSm12conds.mat visual/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_unsm200.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_unsm_unsm200.mat: visual/LeftHemUnsm2conds.mat visual/RightHemUnsm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_sm200.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemSm12conds.mat tactile/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_unsm200.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_unsm_unsm200.mat: tactile/LeftHemUnsm2conds.mat tactile/RightHemUnsm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_sm200_NoOverlap.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemSm12conds.mat auditory/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(100,200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_unsm200_NoOverlap.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(100,200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_unsm_unsm200_NoOverlap.mat: auditory/LeftHemUnsm2conds.mat auditory/RightHemUnsm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(100,200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_sm200_NoOverlap.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemSm12conds.mat motor/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(100,200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_unsm200_NoOverlap.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(100,200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_unsm_unsm200_NoOverlap.mat: motor/LeftHemUnsm2conds.mat motor/RightHemUnsm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(100,200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_sm200_NoOverlap.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemSm12conds.mat visual/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(100,200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_unsm200_NoOverlap.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(100,200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_unsm_unsm200_NoOverlap.mat: visual/LeftHemUnsm2conds.mat visual/RightHemUnsm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(100,200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_sm200_NoOverlap.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemSm12conds.mat tactile/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(100,200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_unsm200_NoOverlap.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(100,200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_unsm_unsm200_NoOverlap.mat: tactile/LeftHemUnsm2conds.mat tactile/RightHemUnsm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(100,200,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

.PHONY: saved100 saved_aud100 saved_vis100 saved_mot100 saved_tact100

saved100: saved_aud100 saved_vis100 saved_mot100
saved_aud100: saved_aud_sm_sm100 saved_aud_sm_unsm100 saved_aud_unsm_unsm100 saved_aud_sm_sm100_NoOverlap saved_aud_sm_unsm100_NoOverlap saved_aud_unsm_unsm100_NoOverlap
saved_vis100: saved_vis_sm_sm100 saved_vis_sm_unsm100 saved_vis_unsm_unsm100 saved_vis_sm_sm100_NoOverlap saved_vis_sm_unsm100_NoOverlap saved_vis_unsm_unsm100_NoOverlap
saved_mot100: saved_mot_sm_sm100 saved_mot_sm_unsm100 saved_mot_unsm_unsm100 saved_mot_sm_sm100_NoOverlap saved_mot_sm_unsm100_NoOverlap saved_mot_unsm_unsm100_NoOverlap
saved_tact100: saved_tact_sm_sm100 saved_tact_sm_unsm100 saved_tact_unsm_unsm100 saved_tact_sm_sm100_NoOverlap saved_tact_sm_unsm100_NoOverlap saved_tact_unsm_unsm100_NoOverlap

saved_aud_sm_sm100: auditory/distinct_sm_sm100.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_sm100.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_sm100

saved_aud_sm_unsm100: auditory/distinct_sm_unsm100.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_unsm100.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_unsm100

saved_aud_unsm_unsm100: auditory/distinct_unsm_unsm100.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_unsm_unsm100.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_unsm_unsm100

saved_vis_sm_sm100: visual/distinct_sm_sm100.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_sm100.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_sm100

saved_vis_sm_unsm100: visual/distinct_sm_unsm100.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_unsm100.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_unsm100

saved_vis_unsm_unsm100: visual/distinct_unsm_unsm100.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_unsm_unsm100.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_unsm_unsm100

saved_mot_sm_sm100: motor/distinct_sm_sm100.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_sm100.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_sm100

saved_mot_sm_unsm100: motor/distinct_sm_unsm100.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_unsm100.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_unsm100

saved_mot_unsm_unsm100: motor/distinct_unsm_unsm100.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_unsm_unsm100.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_unsm_unsm100

saved_tact_sm_sm100: tactile/distinct_sm_sm100.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_sm100.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_sm100

saved_tact_sm_unsm100: tactile/distinct_sm_unsm100.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_unsm100.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_unsm100

saved_tact_unsm_unsm100: tactile/distinct_unsm_unsm100.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_unsm_unsm100.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_unsm_unsm100

saved_aud_sm_sm100_NoOverlap: auditory/distinct_sm_sm100_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_sm100_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_sm100_NoOverlap

saved_aud_sm_unsm100_NoOverlap: auditory/distinct_sm_unsm100_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_unsm100_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_unsm100_NoOverlap

saved_aud_unsm_unsm100_NoOverlap: auditory/distinct_unsm_unsm100_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_unsm_unsm100_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_unsm_unsm100_NoOverlap

saved_vis_sm_sm100_NoOverlap: visual/distinct_sm_sm100_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_sm100_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_sm100_NoOverlap

saved_vis_sm_unsm100_NoOverlap: visual/distinct_sm_unsm100_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_unsm100_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_unsm100_NoOverlap

saved_vis_unsm_unsm100_NoOverlap: visual/distinct_unsm_unsm100_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_unsm_unsm100_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_unsm_unsm100_NoOverlap

saved_mot_sm_sm100_NoOverlap: motor/distinct_sm_sm100_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_sm100_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_sm100_NoOverlap

saved_mot_sm_unsm100_NoOverlap: motor/distinct_sm_unsm100_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_unsm100_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_unsm100_NoOverlap

saved_mot_unsm_unsm100_NoOverlap: motor/distinct_unsm_unsm100_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_unsm_unsm100_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_unsm_unsm100_NoOverlap

saved_tact_sm_sm100_NoOverlap: tactile/distinct_sm_sm100_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_sm100_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_sm100_NoOverlap

saved_tact_sm_unsm100_NoOverlap: tactile/distinct_sm_unsm100_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_unsm100_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_unsm100_NoOverlap

saved_tact_unsm_unsm100_NoOverlap: tactile/distinct_unsm_unsm100_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_unsm_unsm100_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_unsm_unsm100_NoOverlap


.PHONY: distinct100 distinct-aud100 distinct-vis100 distinct-mot100 distinct-tact100
.PHONY: distinct-aud_sm_sm100 distinct-aud_sm_unsm100 distinct-aud_unsm_unsm100 distinct-aud_sm_sm100_NoOverlap distinct-aud_sm_unsm100_NoOverlap distinct-aud_unsm_unsm100_NoOverlap
.PHONY: distinct-vis_sm_sm100 distinct-vis_sm_unsm100 distinct-vis_unsm_unsm100 distinct-vis_sm_sm100_NoOverlap distinct-vis_sm_unsm100_NoOverlap distinct-vis_unsm_unsm100_NoOverlap
.PHONY: distinct-mot_sm_sm100 distinct-mot_sm_unsm100 distinct-mot_unsm_unsm100 distinct-mot_sm_sm100_NoOverlap distinct-mot_sm_unsm100_NoOverlap distinct-mot_unsm_unsm100_NoOverlap
.PHONY: distinct-tact_sm_sm100 distinct-tact_sm_unsm100 distinct-tact_unsm_unsm100 distinct-tact_sm_sm100_NoOverlap distinct-tact_sm_unsm100_NoOverlap distinct-tact_unsm_unsm100_NoOverlap

distinct100: distinct-aud100 distinct-vis100 distinct-mot100
distinct-aud100: distinct-aud_sm_sm100 distinct-aud_sm_unsm100 distinct-aud_unsm_unsm100 distinct-aud_sm_sm100_NoOverlap distinct-aud_sm_unsm100_NoOverlap distinct-aud_unsm_unsm100_NoOverlap
distinct-vis100: distinct-vis_sm_sm100 distinct-vis_sm_unsm100 distinct-vis_unsm_unsm100 distinct-vis_sm_sm100_NoOverlap distinct-vis_sm_unsm100_NoOverlap distinct-vis_unsm_unsm100_NoOverlap
distinct-mot100: distinct-mot_sm_sm100 distinct-mot_sm_unsm100 distinct-mot_unsm_unsm100 distinct-mot_sm_sm100_NoOverlap distinct-mot_sm_unsm100_NoOverlap distinct-mot_unsm_unsm100_NoOverlap
distinct-tact100: distinct-tact_sm_sm100 distinct-tact_sm_unsm100 distinct-tact_unsm_unsm100 distinct-tact_sm_sm100_NoOverlap distinct-tact_sm_unsm100_NoOverlap distinct-tact_unsm_unsm100_NoOverlap

distinct-aud_sm_sm100: auditory/distinct_sm_sm100.mat
distinct-aud_sm_unsm100: auditory/distinct_sm_unsm100.mat
distinct-aud_unsm_unsm100: auditory/distinct_unsm_unsm100.mat
distinct-aud_sm_sm100_NoOverlap: auditory/distinct_sm_sm100_NoOverlap.mat
distinct-aud_sm_unsm100_NoOverlap: auditory/distinct_sm_unsm100_NoOverlap.mat
distinct-aud_unsm_unsm100_NoOverlap: auditory/distinct_unsm_unsm100_NoOverlap.mat

distinct-vis_sm_sm100: visual/distinct_sm_sm100.mat
distinct-vis_sm_unsm100: visual/distinct_sm_unsm100.mat
distinct-vis_unsm_unsm100: visual/distinct_unsm_unsm100.mat
distinct-vis_sm_sm100_NoOverlap: visual/distinct_sm_sm100_NoOverlap.mat
distinct-vis_sm_unsm100_NoOverlap: visual/distinct_sm_unsm100_NoOverlap.mat
distinct-vis_unsm_unsm100_NoOverlap: visual/distinct_unsm_unsm100_NoOverlap.mat

distinct-mot_sm_sm100: motor/distinct_sm_sm100.mat
distinct-mot_sm_unsm100: motor/distinct_sm_unsm100.mat
distinct-mot_unsm_unsm100: motor/distinct_unsm_unsm100.mat
distinct-mot_sm_sm100_NoOverlap: motor/distinct_sm_sm100_NoOverlap.mat
distinct-mot_sm_unsm100_NoOverlap: motor/distinct_sm_unsm100_NoOverlap.mat
distinct-mot_unsm_unsm100_NoOverlap: motor/distinct_unsm_unsm100_NoOverlap.mat

distinct-tact_sm_sm100: tactile/distinct_sm_sm100.mat
distinct-tact_sm_unsm100: tactile/distinct_sm_unsm100.mat
distinct-tact_unsm_unsm100: tactile/distinct_unsm_unsm100.mat
distinct-tact_sm_sm100_NoOverlap: tactile/distinct_sm_sm100_NoOverlap.mat
distinct-tact_sm_unsm100_NoOverlap: tactile/distinct_sm_unsm100_NoOverlap.mat
distinct-tact_unsm_unsm100_NoOverlap: tactile/distinct_unsm_unsm100_NoOverlap.mat

auditory/distinct_sm_sm100.mat: auditory/funcmasked_sm_sm100.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm100.mat','distinct_sm_sm100.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_sm100.mat: visual/funcmasked_sm_sm100.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm100.mat','distinct_sm_sm100.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_sm100.mat: motor/funcmasked_sm_sm100.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm100.mat','distinct_sm_sm100.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_sm100.mat: tactile/funcmasked_sm_sm100.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm100.mat','distinct_sm_sm100.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_unsm100.mat: auditory/funcmasked_sm_unsm100.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm100.mat','distinct_sm_unsm100.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_unsm100.mat: visual/funcmasked_sm_unsm100.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm100.mat','distinct_sm_unsm100.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_unsm100.mat: motor/funcmasked_sm_unsm100.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm100.mat','distinct_sm_unsm100.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_unsm100.mat: tactile/funcmasked_sm_unsm100.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm100.mat','distinct_sm_unsm100.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_unsm_unsm100.mat: auditory/funcmasked_unsm_unsm100.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm100.mat','distinct_unsm_unsm100.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_unsm_unsm100.mat: visual/funcmasked_unsm_unsm100.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm100.mat','distinct_unsm_unsm100.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_unsm_unsm100.mat: motor/funcmasked_unsm_unsm100.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm100.mat','distinct_unsm_unsm100.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_unsm_unsm100.mat: tactile/funcmasked_unsm_unsm100.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm100.mat','distinct_unsm_unsm100.mat'), catch, 'Error running corridff', end; exit"


auditory/distinct_sm_sm100_NoOverlap.mat: auditory/funcmasked_sm_sm100_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm100_NoOverlap.mat','distinct_sm_sm100_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_sm100_NoOverlap.mat: visual/funcmasked_sm_sm100_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm100_NoOverlap.mat','distinct_sm_sm100_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_sm100_NoOverlap.mat: motor/funcmasked_sm_sm100_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm100_NoOverlap.mat','distinct_sm_sm100_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_sm100_NoOverlap.mat: tactile/funcmasked_sm_sm100_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm100_NoOverlap.mat','distinct_sm_sm100_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_unsm100_NoOverlap.mat: auditory/funcmasked_sm_unsm100_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm100_NoOverlap.mat','distinct_sm_unsm100_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_unsm100_NoOverlap.mat: visual/funcmasked_sm_unsm100_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm100_NoOverlap.mat','distinct_sm_unsm100_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_unsm100_NoOverlap.mat: motor/funcmasked_sm_unsm100_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm100_NoOverlap.mat','distinct_sm_unsm100_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_unsm100_NoOverlap.mat: tactile/funcmasked_sm_unsm100_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm100_NoOverlap.mat','distinct_sm_unsm100_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_unsm_unsm100_NoOverlap.mat: auditory/funcmasked_unsm_unsm100_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm100_NoOverlap.mat','distinct_unsm_unsm100_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_unsm_unsm100_NoOverlap.mat: visual/funcmasked_unsm_unsm100_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm100_NoOverlap.mat','distinct_unsm_unsm100_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_unsm_unsm100_NoOverlap.mat: motor/funcmasked_unsm_unsm100_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm100_NoOverlap.mat','distinct_unsm_unsm100_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_unsm_unsm100_NoOverlap.mat: tactile/funcmasked_unsm_unsm100_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm100_NoOverlap.mat','distinct_unsm_unsm100_NoOverlap.mat'), catch, 'Error running corridff', end; exit"


auditory/funcmasked_sm_sm100.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemSm12conds.mat auditory/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_unsm100.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_unsm_unsm100.mat: auditory/LeftHemUnsm2conds.mat auditory/RightHemUnsm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_sm100.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemSm12conds.mat motor/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_unsm100.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_unsm_unsm100.mat: motor/LeftHemUnsm2conds.mat motor/RightHemUnsm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_sm100.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemSm12conds.mat visual/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_unsm100.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_unsm_unsm100.mat: visual/LeftHemUnsm2conds.mat visual/RightHemUnsm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_sm100.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemSm12conds.mat tactile/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_unsm100.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_unsm_unsm100.mat: tactile/LeftHemUnsm2conds.mat tactile/RightHemUnsm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_sm100_NoOverlap.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemSm12conds.mat auditory/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(50,100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_unsm100_NoOverlap.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(50,100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_unsm_unsm100_NoOverlap.mat: auditory/LeftHemUnsm2conds.mat auditory/RightHemUnsm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(50,100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_sm100_NoOverlap.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemSm12conds.mat motor/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(50,100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_unsm100_NoOverlap.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(50,100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_unsm_unsm100_NoOverlap.mat: motor/LeftHemUnsm2conds.mat motor/RightHemUnsm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(50,100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_sm100_NoOverlap.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemSm12conds.mat visual/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(50,100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_unsm100_NoOverlap.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(50,100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_unsm_unsm100_NoOverlap.mat: visual/LeftHemUnsm2conds.mat visual/RightHemUnsm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(50,100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_sm100_NoOverlap.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemSm12conds.mat tactile/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(50,100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_unsm100_NoOverlap.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(50,100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_unsm_unsm100_NoOverlap.mat: tactile/LeftHemUnsm2conds.mat tactile/RightHemUnsm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(50,100,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

.PHONY: saved2000 saved_aud2000 saved_vis2000 saved_mot2000 saved_tact2000

saved2000: saved_aud2000 saved_vis2000 saved_mot2000
saved_aud2000: saved_aud_sm_sm2000 saved_aud_sm_unsm2000 saved_aud_unsm_unsm2000 saved_aud_sm_sm2000_NoOverlap saved_aud_sm_unsm2000_NoOverlap saved_aud_unsm_unsm2000_NoOverlap
saved_vis2000: saved_vis_sm_sm2000 saved_vis_sm_unsm2000 saved_vis_unsm_unsm2000 saved_vis_sm_sm2000_NoOverlap saved_vis_sm_unsm2000_NoOverlap saved_vis_unsm_unsm2000_NoOverlap
saved_mot2000: saved_mot_sm_sm2000 saved_mot_sm_unsm2000 saved_mot_unsm_unsm2000 saved_mot_sm_sm2000_NoOverlap saved_mot_sm_unsm2000_NoOverlap saved_mot_unsm_unsm2000_NoOverlap
saved_tact2000: saved_tact_sm_sm2000 saved_tact_sm_unsm2000 saved_tact_unsm_unsm2000 saved_tact_sm_sm2000_NoOverlap saved_tact_sm_unsm2000_NoOverlap saved_tact_unsm_unsm2000_NoOverlap

saved_aud_sm_sm2000: auditory/distinct_sm_sm2000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_sm2000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_sm2000

saved_aud_sm_unsm2000: auditory/distinct_sm_unsm2000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_unsm2000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_unsm2000

saved_aud_unsm_unsm2000: auditory/distinct_unsm_unsm2000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_unsm_unsm2000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_unsm_unsm2000

saved_vis_sm_sm2000: visual/distinct_sm_sm2000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_sm2000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_sm2000

saved_vis_sm_unsm2000: visual/distinct_sm_unsm2000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_unsm2000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_unsm2000

saved_vis_unsm_unsm2000: visual/distinct_unsm_unsm2000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_unsm_unsm2000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_unsm_unsm2000

saved_mot_sm_sm2000: motor/distinct_sm_sm2000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_sm2000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_sm2000

saved_mot_sm_unsm2000: motor/distinct_sm_unsm2000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_unsm2000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_unsm2000

saved_mot_unsm_unsm2000: motor/distinct_unsm_unsm2000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_unsm_unsm2000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_unsm_unsm2000

saved_tact_sm_sm2000: tactile/distinct_sm_sm2000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_sm2000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_sm2000

saved_tact_sm_unsm2000: tactile/distinct_sm_unsm2000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_unsm2000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_unsm2000

saved_tact_unsm_unsm2000: tactile/distinct_unsm_unsm2000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_unsm_unsm2000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_unsm_unsm2000

saved_aud_sm_sm2000_NoOverlap: auditory/distinct_sm_sm2000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_sm2000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_sm2000_NoOverlap

saved_aud_sm_unsm2000_NoOverlap: auditory/distinct_sm_unsm2000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_unsm2000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_unsm2000_NoOverlap

saved_aud_unsm_unsm2000_NoOverlap: auditory/distinct_unsm_unsm2000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_unsm_unsm2000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_unsm_unsm2000_NoOverlap

saved_vis_sm_sm2000_NoOverlap: visual/distinct_sm_sm2000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_sm2000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_sm2000_NoOverlap

saved_vis_sm_unsm2000_NoOverlap: visual/distinct_sm_unsm2000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_unsm2000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_unsm2000_NoOverlap

saved_vis_unsm_unsm2000_NoOverlap: visual/distinct_unsm_unsm2000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_unsm_unsm2000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_unsm_unsm2000_NoOverlap

saved_mot_sm_sm2000_NoOverlap: motor/distinct_sm_sm2000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_sm2000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_sm2000_NoOverlap

saved_mot_sm_unsm2000_NoOverlap: motor/distinct_sm_unsm2000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_unsm2000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_unsm2000_NoOverlap

saved_mot_unsm_unsm2000_NoOverlap: motor/distinct_unsm_unsm2000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_unsm_unsm2000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_unsm_unsm2000_NoOverlap

saved_tact_sm_sm2000_NoOverlap: tactile/distinct_sm_sm2000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_sm2000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_sm2000_NoOverlap

saved_tact_sm_unsm2000_NoOverlap: tactile/distinct_sm_unsm2000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_unsm2000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_unsm2000_NoOverlap

saved_tact_unsm_unsm2000_NoOverlap: tactile/distinct_unsm_unsm2000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_unsm_unsm2000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_unsm_unsm2000_NoOverlap

.PHONY: distinct2000 distinct-aud2000 distinct-vis2000 distinct-mot2000 distinct-tact2000
.PHONY: distinct-aud_sm_sm2000 distinct-aud_sm_unsm2000 distinct-aud_unsm_unsm2000 distinct-aud_sm_sm2000_NoOverlap distinct-aud_sm_unsm2000_NoOverlap distinct-aud_unsm_unsm2000_NoOverlap
.PHONY: distinct-vis_sm_sm2000 distinct-vis_sm_unsm2000 distinct-vis_unsm_unsm2000 distinct-vis_sm_sm2000_NoOverlap distinct-vis_sm_unsm2000_NoOverlap distinct-vis_unsm_unsm2000_NoOverlap
.PHONY: distinct-mot_sm_sm2000 distinct-mot_sm_unsm2000 distinct-mot_unsm_unsm2000 distinct-mot_sm_sm2000_NoOverlap distinct-mot_sm_unsm2000_NoOverlap distinct-mot_unsm_unsm2000_NoOverlap
.PHONY: distinct-tact_sm_sm2000 distinct-tact_sm_unsm2000 distinct-tact_unsm_unsm2000 distinct-tact_sm_sm2000_NoOverlap distinct-tact_sm_unsm2000_NoOverlap distinct-tact_unsm_unsm2000_NoOverlap

distinct2000: distinct-aud2000 distinct-vis2000 distinct-mot2000
distinct-aud2000: distinct-aud_sm_sm2000 distinct-aud_sm_unsm2000 distinct-aud_unsm_unsm2000 distinct-aud_sm_sm2000_NoOverlap distinct-aud_sm_unsm2000_NoOverlap distinct-aud_unsm_unsm2000_NoOverlap
distinct-vis2000: distinct-vis_sm_sm2000 distinct-vis_sm_unsm2000 distinct-vis_unsm_unsm2000 distinct-vis_sm_sm2000_NoOverlap distinct-vis_sm_unsm2000_NoOverlap distinct-vis_unsm_unsm2000_NoOverlap
distinct-mot2000: distinct-mot_sm_sm2000 distinct-mot_sm_unsm2000 distinct-mot_unsm_unsm2000 distinct-mot_sm_sm2000_NoOverlap distinct-mot_sm_unsm2000_NoOverlap distinct-mot_unsm_unsm2000_NoOverlap
distinct-tact2000: distinct-tact_sm_sm2000 distinct-tact_sm_unsm2000 distinct-tact_unsm_unsm2000 distinct-tact_sm_sm2000_NoOverlap distinct-tact_sm_unsm2000_NoOverlap distinct-tact_unsm_unsm2000_NoOverlap

distinct-aud_sm_sm2000: auditory/distinct_sm_sm2000.mat
distinct-aud_sm_unsm2000: auditory/distinct_sm_unsm2000.mat
distinct-aud_unsm_unsm2000: auditory/distinct_unsm_unsm2000.mat
distinct-aud_sm_sm2000_NoOverlap: auditory/distinct_sm_sm2000_NoOverlap.mat
distinct-aud_sm_unsm2000_NoOverlap: auditory/distinct_sm_unsm2000_NoOverlap.mat
distinct-aud_unsm_unsm2000_NoOverlap: auditory/distinct_unsm_unsm2000_NoOverlap.mat

distinct-vis_sm_sm2000: visual/distinct_sm_sm2000.mat
distinct-vis_sm_unsm2000: visual/distinct_sm_unsm2000.mat
distinct-vis_unsm_unsm2000: visual/distinct_unsm_unsm2000.mat
distinct-vis_sm_sm2000_NoOverlap: visual/distinct_sm_sm2000_NoOverlap.mat
distinct-vis_sm_unsm2000_NoOverlap: visual/distinct_sm_unsm2000_NoOverlap.mat
distinct-vis_unsm_unsm2000_NoOverlap: visual/distinct_unsm_unsm2000_NoOverlap.mat

distinct-mot_sm_sm2000: motor/distinct_sm_sm2000.mat
distinct-mot_sm_unsm2000: motor/distinct_sm_unsm2000.mat
distinct-mot_unsm_unsm2000: motor/distinct_unsm_unsm2000.mat
distinct-mot_sm_sm2000_NoOverlap: motor/distinct_sm_sm2000_NoOverlap.mat
distinct-mot_sm_unsm2000_NoOverlap: motor/distinct_sm_unsm2000_NoOverlap.mat
distinct-mot_unsm_unsm2000_NoOverlap: motor/distinct_unsm_unsm2000_NoOverlap.mat

distinct-tact_sm_sm2000: tactile/distinct_sm_sm2000.mat
distinct-tact_sm_unsm2000: tactile/distinct_sm_unsm2000.mat
distinct-tact_unsm_unsm2000: tactile/distinct_unsm_unsm2000.mat
distinct-tact_sm_sm2000_NoOverlap: tactile/distinct_sm_sm2000_NoOverlap.mat
distinct-tact_sm_unsm2000_NoOverlap: tactile/distinct_sm_unsm2000_NoOverlap.mat
distinct-tact_unsm_unsm2000_NoOverlap: tactile/distinct_unsm_unsm2000_NoOverlap.mat

auditory/distinct_sm_sm2000.mat: auditory/funcmasked_sm_sm2000.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm2000.mat','distinct_sm_sm2000.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_sm2000.mat: visual/funcmasked_sm_sm2000.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm2000.mat','distinct_sm_sm2000.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_sm2000.mat: motor/funcmasked_sm_sm2000.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm2000.mat','distinct_sm_sm2000.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_sm2000.mat: tactile/funcmasked_sm_sm2000.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm2000.mat','distinct_sm_sm2000.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_unsm2000.mat: auditory/funcmasked_sm_unsm2000.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm2000.mat','distinct_sm_unsm2000.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_unsm2000.mat: visual/funcmasked_sm_unsm2000.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm2000.mat','distinct_sm_unsm2000.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_unsm2000.mat: motor/funcmasked_sm_unsm2000.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm2000.mat','distinct_sm_unsm2000.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_unsm2000.mat: tactile/funcmasked_sm_unsm2000.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm2000.mat','distinct_sm_unsm2000.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_unsm_unsm2000.mat: auditory/funcmasked_unsm_unsm2000.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm2000.mat','distinct_unsm_unsm2000.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_unsm_unsm2000.mat: visual/funcmasked_unsm_unsm2000.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm2000.mat','distinct_unsm_unsm2000.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_unsm_unsm2000.mat: motor/funcmasked_unsm_unsm2000.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm2000.mat','distinct_unsm_unsm2000.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_unsm_unsm2000.mat: tactile/funcmasked_unsm_unsm2000.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm2000.mat','distinct_unsm_unsm2000.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_sm2000_NoOverlap.mat: auditory/funcmasked_sm_sm2000_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm2000_NoOverlap.mat','distinct_sm_sm2000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_sm2000_NoOverlap.mat: visual/funcmasked_sm_sm2000_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm2000_NoOverlap.mat','distinct_sm_sm2000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_sm2000_NoOverlap.mat: motor/funcmasked_sm_sm2000_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm2000_NoOverlap.mat','distinct_sm_sm2000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_sm2000_NoOverlap.mat: tactile/funcmasked_sm_sm2000_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm2000_NoOverlap.mat','distinct_sm_sm2000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_unsm2000_NoOverlap.mat: auditory/funcmasked_sm_unsm2000_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm2000_NoOverlap.mat','distinct_sm_unsm2000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_unsm2000_NoOverlap.mat: visual/funcmasked_sm_unsm2000_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm2000_NoOverlap.mat','distinct_sm_unsm2000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_unsm2000_NoOverlap.mat: motor/funcmasked_sm_unsm2000_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm2000_NoOverlap.mat','distinct_sm_unsm2000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_unsm2000_NoOverlap.mat: tactile/funcmasked_sm_unsm2000_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm2000_NoOverlap.mat','distinct_sm_unsm2000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_unsm_unsm2000_NoOverlap.mat: auditory/funcmasked_unsm_unsm2000_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm2000_NoOverlap.mat','distinct_unsm_unsm2000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_unsm_unsm2000_NoOverlap.mat: visual/funcmasked_unsm_unsm2000_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm2000_NoOverlap.mat','distinct_unsm_unsm2000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_unsm_unsm2000_NoOverlap.mat: motor/funcmasked_unsm_unsm2000_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm2000_NoOverlap.mat','distinct_unsm_unsm2000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_unsm_unsm2000_NoOverlap.mat: tactile/funcmasked_unsm_unsm2000_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm2000_NoOverlap.mat','distinct_unsm_unsm2000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"


auditory/funcmasked_sm_sm2000.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemSm12conds.mat auditory/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_unsm2000.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_unsm_unsm2000.mat: auditory/LeftHemUnsm2conds.mat auditory/RightHemUnsm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_sm2000.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemSm12conds.mat motor/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_unsm2000.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_unsm_unsm2000.mat: motor/LeftHemUnsm2conds.mat motor/RightHemUnsm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_sm2000.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemSm12conds.mat visual/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_unsm2000.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_unsm_unsm2000.mat: visual/LeftHemUnsm2conds.mat visual/RightHemUnsm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_sm2000.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemSm12conds.mat tactile/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_unsm2000.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_unsm_unsm2000.mat: tactile/LeftHemUnsm2conds.mat tactile/RightHemUnsm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_sm2000_NoOverlap.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemSm12conds.mat auditory/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(1000,2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_unsm2000_NoOverlap.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(1000,2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_unsm_unsm2000_NoOverlap.mat: auditory/LeftHemUnsm2conds.mat auditory/RightHemUnsm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(1000,2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_sm2000_NoOverlap.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemSm12conds.mat motor/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(1000,2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_unsm2000_NoOverlap.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(1000,2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_unsm_unsm2000_NoOverlap.mat: motor/LeftHemUnsm2conds.mat motor/RightHemUnsm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(1000,2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_sm2000_NoOverlap.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemSm12conds.mat visual/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(1000,2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_unsm2000_NoOverlap.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(1000,2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_unsm_unsm2000_NoOverlap.mat: visual/LeftHemUnsm2conds.mat visual/RightHemUnsm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(1000,2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_sm2000_NoOverlap.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemSm12conds.mat tactile/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(1000,2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_unsm2000_NoOverlap.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(1000,2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_unsm_unsm2000_NoOverlap.mat: tactile/LeftHemUnsm2conds.mat tactile/RightHemUnsm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(1000,2000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

.PHONY: saved400 saved_aud400 saved_vis400 saved_mot400 saved_tact400

saved400: saved_aud400 saved_vis400 saved_mot400
saved_aud400: saved_aud_sm_sm400 saved_aud_sm_unsm400 saved_aud_unsm_unsm400 saved_aud_sm_sm400_NoOverlap saved_aud_sm_unsm400_NoOverlap saved_aud_unsm_unsm400_NoOverlap
saved_vis400: saved_vis_sm_sm400 saved_vis_sm_unsm400 saved_vis_unsm_unsm400 saved_vis_sm_sm400_NoOverlap saved_vis_sm_unsm400_NoOverlap saved_vis_unsm_unsm400_NoOverlap
saved_mot400: saved_mot_sm_sm400 saved_mot_sm_unsm400 saved_mot_unsm_unsm400 saved_mot_sm_sm400_NoOverlap saved_mot_sm_unsm400_NoOverlap saved_mot_unsm_unsm400_NoOverlap
saved_tact400: saved_tact_sm_sm400 saved_tact_sm_unsm400 saved_tact_unsm_unsm400 saved_tact_sm_sm400_NoOverlap saved_tact_sm_unsm400_NoOverlap saved_tact_unsm_unsm400_NoOverlap

saved_aud_sm_sm400: auditory/distinct_sm_sm400.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_sm400.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_sm400

saved_aud_sm_unsm400: auditory/distinct_sm_unsm400.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_unsm400.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_unsm400

saved_aud_unsm_unsm400: auditory/distinct_unsm_unsm400.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_unsm_unsm400.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_unsm_unsm400

saved_vis_sm_sm400: visual/distinct_sm_sm400.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_sm400.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_sm400

saved_vis_sm_unsm400: visual/distinct_sm_unsm400.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_unsm400.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_unsm400

saved_vis_unsm_unsm400: visual/distinct_unsm_unsm400.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_unsm_unsm400.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_unsm_unsm400

saved_mot_sm_sm400: motor/distinct_sm_sm400.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_sm400.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_sm400

saved_mot_sm_unsm400: motor/distinct_sm_unsm400.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_unsm400.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_unsm400

saved_mot_unsm_unsm400: motor/distinct_unsm_unsm400.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_unsm_unsm400.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_unsm_unsm400

saved_tact_sm_sm400: tactile/distinct_sm_sm400.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_sm400.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_sm400

saved_tact_sm_unsm400: tactile/distinct_sm_unsm400.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_unsm400.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_unsm400

saved_tact_unsm_unsm400: tactile/distinct_unsm_unsm400.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_unsm_unsm400.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_unsm_unsm400

saved_aud_sm_sm400_NoOverlap: auditory/distinct_sm_sm400_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_sm400_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_sm400_NoOverlap

saved_aud_sm_unsm400_NoOverlap: auditory/distinct_sm_unsm400_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_unsm400_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_unsm400_NoOverlap

saved_aud_unsm_unsm400_NoOverlap: auditory/distinct_unsm_unsm400_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_unsm_unsm400_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_unsm_unsm400_NoOverlap

saved_vis_sm_sm400_NoOverlap: visual/distinct_sm_sm400_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_sm400_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_sm400_NoOverlap

saved_vis_sm_unsm400_NoOverlap: visual/distinct_sm_unsm400_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_unsm400_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_unsm400_NoOverlap

saved_vis_unsm_unsm400_NoOverlap: visual/distinct_unsm_unsm400_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_unsm_unsm400_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_unsm_unsm400_NoOverlap

saved_mot_sm_sm400_NoOverlap: motor/distinct_sm_sm400_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_sm400_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_sm400_NoOverlap

saved_mot_sm_unsm400_NoOverlap: motor/distinct_sm_unsm400_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_unsm400_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_unsm400_NoOverlap

saved_mot_unsm_unsm400_NoOverlap: motor/distinct_unsm_unsm400_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_unsm_unsm400_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_unsm_unsm400_NoOverlap

saved_tact_sm_sm400_NoOverlap: tactile/distinct_sm_sm400_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_sm400_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_sm400_NoOverlap

saved_tact_sm_unsm400_NoOverlap: tactile/distinct_sm_unsm400_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_unsm400_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_unsm400_NoOverlap

saved_tact_unsm_unsm400_NoOverlap: tactile/distinct_unsm_unsm400_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_unsm_unsm400_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_unsm_unsm400_NoOverlap


.PHONY: distinct400 distinct-aud400 distinct-vis400 distinct-mot400 distinct-tact400
.PHONY: distinct-aud_sm_sm400 distinct-aud_sm_unsm400 distinct-aud_unsm_unsm400 distinct-aud_sm_sm400_NoOverlap distinct-aud_sm_unsm400_NoOverlap distinct-aud_unsm_unsm400_NoOverlap
.PHONY: distinct-vis_sm_sm400 distinct-vis_sm_unsm400 distinct-vis_unsm_unsm400 distinct-vis_sm_sm400_NoOverlap distinct-vis_sm_unsm400_NoOverlap distinct-vis_unsm_unsm400_NoOverlap
.PHONY: distinct-mot_sm_sm400 distinct-mot_sm_unsm400 distinct-mot_unsm_unsm400 distinct-mot_sm_sm400_NoOverlap distinct-mot_sm_unsm400_NoOverlap distinct-mot_unsm_unsm400_NoOverlap
.PHONY: distinct-tact_sm_sm400 distinct-tact_sm_unsm400 distinct-tact_unsm_unsm400 distinct-tact_sm_sm400_NoOverlap distinct-tact_sm_unsm400_NoOverlap distinct-tact_unsm_unsm400_NoOverlap

distinct400: distinct-aud400 distinct-vis400 distinct-mot400
distinct-aud400: distinct-aud_sm_sm400 distinct-aud_sm_unsm400 distinct-aud_unsm_unsm400 distinct-aud_sm_sm400_NoOverlap distinct-aud_sm_unsm400_NoOverlap distinct-aud_unsm_unsm400_NoOverlap
distinct-vis400: distinct-vis_sm_sm400 distinct-vis_sm_unsm400 distinct-vis_unsm_unsm400 distinct-vis_sm_sm400_NoOverlap distinct-vis_sm_unsm400_NoOverlap distinct-vis_unsm_unsm400_NoOverlap
distinct-mot400: distinct-mot_sm_sm400 distinct-mot_sm_unsm400 distinct-mot_unsm_unsm400 distinct-mot_sm_sm400_NoOverlap distinct-mot_sm_unsm400_NoOverlap distinct-mot_unsm_unsm400_NoOverlap
distinct-tact400: distinct-tact_sm_sm400 distinct-tact_sm_unsm400 distinct-tact_unsm_unsm400 distinct-tact_sm_sm400_NoOverlap distinct-tact_sm_unsm400_NoOverlap distinct-tact_unsm_unsm400_NoOverlap

distinct-aud_sm_sm400: auditory/distinct_sm_sm400.mat
distinct-aud_sm_unsm400: auditory/distinct_sm_unsm400.mat
distinct-aud_unsm_unsm400: auditory/distinct_unsm_unsm400.mat
distinct-aud_sm_sm400_NoOverlap: auditory/distinct_sm_sm400_NoOverlap.mat
distinct-aud_sm_unsm400_NoOverlap: auditory/distinct_sm_unsm400_NoOverlap.mat
distinct-aud_unsm_unsm400_NoOverlap: auditory/distinct_unsm_unsm400_NoOverlap.mat

distinct-vis_sm_sm400: visual/distinct_sm_sm400.mat
distinct-vis_sm_unsm400: visual/distinct_sm_unsm400.mat
distinct-vis_unsm_unsm400: visual/distinct_unsm_unsm400.mat
distinct-vis_sm_sm400_NoOverlap: visual/distinct_sm_sm400_NoOverlap.mat
distinct-vis_sm_unsm400_NoOverlap: visual/distinct_sm_unsm400_NoOverlap.mat
distinct-vis_unsm_unsm400_NoOverlap: visual/distinct_unsm_unsm400_NoOverlap.mat

distinct-mot_sm_sm400: motor/distinct_sm_sm400.mat
distinct-mot_sm_unsm400: motor/distinct_sm_unsm400.mat
distinct-mot_unsm_unsm400: motor/distinct_unsm_unsm400.mat
distinct-mot_sm_sm400_NoOverlap: motor/distinct_sm_sm400_NoOverlap.mat
distinct-mot_sm_unsm400_NoOverlap: motor/distinct_sm_unsm400_NoOverlap.mat
distinct-mot_unsm_unsm400_NoOverlap: motor/distinct_unsm_unsm400_NoOverlap.mat

distinct-tact_sm_sm400: tactile/distinct_sm_sm400.mat
distinct-tact_sm_unsm400: tactile/distinct_sm_unsm400.mat
distinct-tact_unsm_unsm400: tactile/distinct_unsm_unsm400.mat
distinct-tact_sm_sm400_NoOverlap: tactile/distinct_sm_sm400_NoOverlap.mat
distinct-tact_sm_unsm400_NoOverlap: tactile/distinct_sm_unsm400_NoOverlap.mat
distinct-tact_unsm_unsm400_NoOverlap: tactile/distinct_unsm_unsm400_NoOverlap.mat

auditory/distinct_sm_sm400.mat: auditory/funcmasked_sm_sm400.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm400.mat','distinct_sm_sm400.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_sm400.mat: visual/funcmasked_sm_sm400.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm400.mat','distinct_sm_sm400.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_sm400.mat: motor/funcmasked_sm_sm400.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm400.mat','distinct_sm_sm400.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_sm400.mat: tactile/funcmasked_sm_sm400.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm400.mat','distinct_sm_sm400.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_unsm400.mat: auditory/funcmasked_sm_unsm400.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm400.mat','distinct_sm_unsm400.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_unsm400.mat: visual/funcmasked_sm_unsm400.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm400.mat','distinct_sm_unsm400.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_unsm400.mat: motor/funcmasked_sm_unsm400.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm400.mat','distinct_sm_unsm400.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_unsm400.mat: tactile/funcmasked_sm_unsm400.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm400.mat','distinct_sm_unsm400.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_unsm_unsm400.mat: auditory/funcmasked_unsm_unsm400.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm400.mat','distinct_unsm_unsm400.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_unsm_unsm400.mat: visual/funcmasked_unsm_unsm400.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm400.mat','distinct_unsm_unsm400.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_unsm_unsm400.mat: motor/funcmasked_unsm_unsm400.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm400.mat','distinct_unsm_unsm400.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_unsm_unsm400.mat: tactile/funcmasked_unsm_unsm400.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm400.mat','distinct_unsm_unsm400.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_sm400_NoOverlap.mat: auditory/funcmasked_sm_sm400_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm400_NoOverlap.mat','distinct_sm_sm400_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_sm400_NoOverlap.mat: visual/funcmasked_sm_sm400_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm400_NoOverlap.mat','distinct_sm_sm400_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_sm400_NoOverlap.mat: motor/funcmasked_sm_sm400_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm400_NoOverlap.mat','distinct_sm_sm400_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_sm400_NoOverlap.mat: tactile/funcmasked_sm_sm400_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm400_NoOverlap.mat','distinct_sm_sm400_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_unsm400_NoOverlap.mat: auditory/funcmasked_sm_unsm400_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm400_NoOverlap.mat','distinct_sm_unsm400_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_unsm400_NoOverlap.mat: visual/funcmasked_sm_unsm400_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm400_NoOverlap.mat','distinct_sm_unsm400_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_unsm400_NoOverlap.mat: motor/funcmasked_sm_unsm400_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm400_NoOverlap.mat','distinct_sm_unsm400_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_unsm400_NoOverlap.mat: tactile/funcmasked_sm_unsm400_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm400_NoOverlap.mat','distinct_sm_unsm400_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_unsm_unsm400_NoOverlap.mat: auditory/funcmasked_unsm_unsm400_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm400_NoOverlap.mat','distinct_unsm_unsm400_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_unsm_unsm400_NoOverlap.mat: visual/funcmasked_unsm_unsm400_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm400_NoOverlap.mat','distinct_unsm_unsm400_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_unsm_unsm400_NoOverlap.mat: motor/funcmasked_unsm_unsm400_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm400_NoOverlap.mat','distinct_unsm_unsm400_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_unsm_unsm400_NoOverlap.mat: tactile/funcmasked_unsm_unsm400_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm400_NoOverlap.mat','distinct_unsm_unsm400_NoOverlap.mat'), catch, 'Error running corridff', end; exit"


auditory/funcmasked_sm_sm400.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemSm12conds.mat auditory/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_unsm400.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_unsm_unsm400.mat: auditory/LeftHemUnsm2conds.mat auditory/RightHemUnsm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_sm400.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemSm12conds.mat motor/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_unsm400.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_unsm_unsm400.mat: motor/LeftHemUnsm2conds.mat motor/RightHemUnsm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_sm400.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemSm12conds.mat visual/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_unsm400.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_unsm_unsm400.mat: visual/LeftHemUnsm2conds.mat visual/RightHemUnsm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_sm400.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemSm12conds.mat tactile/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_unsm400.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_unsm_unsm400.mat: tactile/LeftHemUnsm2conds.mat tactile/RightHemUnsm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_sm400_NoOverlap.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemSm12conds.mat auditory/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(300,400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_unsm400_NoOverlap.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(300,400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_unsm_unsm400_NoOverlap.mat: auditory/LeftHemUnsm2conds.mat auditory/RightHemUnsm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(300,400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_sm400_NoOverlap.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemSm12conds.mat motor/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(300,400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_unsm400_NoOverlap.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(300,400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_unsm_unsm400_NoOverlap.mat: motor/LeftHemUnsm2conds.mat motor/RightHemUnsm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(300,400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_sm400_NoOverlap.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemSm12conds.mat visual/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(300,400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_unsm400_NoOverlap.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(300,400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_unsm_unsm400_NoOverlap.mat: visual/LeftHemUnsm2conds.mat visual/RightHemUnsm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(300,400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_sm400_NoOverlap.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemSm12conds.mat tactile/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(300,400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_unsm400_NoOverlap.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(300,400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_unsm_unsm400_NoOverlap.mat: tactile/LeftHemUnsm2conds.mat tactile/RightHemUnsm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(300,400,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"


.PHONY: saved600 saved_aud600 saved_vis600 saved_mot600 saved_tact600

saved600: saved_aud600 saved_vis600 saved_mot600
saved_aud600: saved_aud_sm_sm600 saved_aud_sm_unsm600 saved_aud_unsm_unsm600 saved_aud_sm_sm600_NoOverlap saved_aud_sm_unsm600_NoOverlap saved_aud_unsm_unsm600_NoOverlap
saved_vis600: saved_vis_sm_sm600 saved_vis_sm_unsm600 saved_vis_unsm_unsm600 saved_vis_sm_sm600_NoOverlap saved_vis_sm_unsm600_NoOverlap saved_vis_unsm_unsm600_NoOverlap
saved_mot600: saved_mot_sm_sm600 saved_mot_sm_unsm600 saved_mot_unsm_unsm600 saved_mot_sm_sm600_NoOverlap saved_mot_sm_unsm600_NoOverlap saved_mot_unsm_unsm600_NoOverlap
saved_tact600: saved_tact_sm_sm600 saved_tact_sm_unsm600 saved_tact_unsm_unsm600 saved_tact_sm_sm600_NoOverlap saved_tact_sm_unsm600_NoOverlap saved_tact_unsm_unsm600_NoOverlap

saved_aud_sm_sm600: auditory/distinct_sm_sm600.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_sm600.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_sm600

saved_aud_sm_unsm600: auditory/distinct_sm_unsm600.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_unsm600.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_unsm600

saved_aud_unsm_unsm600: auditory/distinct_unsm_unsm600.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_unsm_unsm600.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_unsm_unsm600

saved_vis_sm_sm600: visual/distinct_sm_sm600.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_sm600.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_sm600

saved_vis_sm_unsm600: visual/distinct_sm_unsm600.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_unsm600.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_unsm600

saved_vis_unsm_unsm600: visual/distinct_unsm_unsm600.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_unsm_unsm600.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_unsm_unsm600

saved_mot_sm_sm600: motor/distinct_sm_sm600.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_sm600.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_sm600

saved_mot_sm_unsm600: motor/distinct_sm_unsm600.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_unsm600.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_unsm600

saved_mot_unsm_unsm600: motor/distinct_unsm_unsm600.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_unsm_unsm600.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_unsm_unsm600

saved_tact_sm_sm600: tactile/distinct_sm_sm600.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_sm600.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_sm600

saved_tact_sm_unsm600: tactile/distinct_sm_unsm600.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_unsm600.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_unsm600

saved_tact_unsm_unsm600: tactile/distinct_unsm_unsm600.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_unsm_unsm600.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_unsm_unsm600

saved_aud_sm_sm600_NoOverlap: auditory/distinct_sm_sm600_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_sm600_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_sm600_NoOverlap

saved_aud_sm_unsm600_NoOverlap: auditory/distinct_sm_unsm600_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_unsm600_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_unsm600_NoOverlap

saved_aud_unsm_unsm600_NoOverlap: auditory/distinct_unsm_unsm600_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_unsm_unsm600_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_unsm_unsm600_NoOverlap

saved_vis_sm_sm600_NoOverlap: visual/distinct_sm_sm600_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_sm600_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_sm600_NoOverlap

saved_vis_sm_unsm600_NoOverlap: visual/distinct_sm_unsm600_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_unsm600_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_unsm600_NoOverlap

saved_vis_unsm_unsm600_NoOverlap: visual/distinct_unsm_unsm600_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_unsm_unsm600_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_unsm_unsm600_NoOverlap

saved_mot_sm_sm600_NoOverlap: motor/distinct_sm_sm600_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_sm600_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_sm600_NoOverlap

saved_mot_sm_unsm600_NoOverlap: motor/distinct_sm_unsm600_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_unsm600_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_unsm600_NoOverlap

saved_mot_unsm_unsm600_NoOverlap: motor/distinct_unsm_unsm600_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_unsm_unsm600_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_unsm_unsm600_NoOverlap

saved_tact_sm_sm600_NoOverlap: tactile/distinct_sm_sm600_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_sm600_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_sm600_NoOverlap

saved_tact_sm_unsm600_NoOverlap: tactile/distinct_sm_unsm600_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_unsm600_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_unsm600_NoOverlap

saved_tact_unsm_unsm600_NoOverlap: tactile/distinct_unsm_unsm600_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_unsm_unsm600_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_unsm_unsm600_NoOverlap



.PHONY: distinct600 distinct-aud600 distinct-vis600 distinct-mot600 distinct-tact600
.PHONY: distinct-aud_sm_sm600 distinct-aud_sm_unsm600 distinct-aud_unsm_unsm600 distinct-aud_sm_sm600_NoOverlap distinct-aud_sm_unsm600_NoOverlap distinct-aud_unsm_unsm600_NoOverlap
.PHONY: distinct-vis_sm_sm600 distinct-vis_sm_unsm600 distinct-vis_unsm_unsm600 distinct-vis_sm_sm600_NoOverlap distinct-vis_sm_unsm600_NoOverlap distinct-vis_unsm_unsm600_NoOverlap
.PHONY: distinct-mot_sm_sm600 distinct-mot_sm_unsm600 distinct-mot_unsm_unsm600 distinct-mot_sm_sm600_NoOverlap distinct-mot_sm_unsm600_NoOverlap distinct-mot_unsm_unsm600_NoOverlap
.PHONY: distinct-mot_sm_sm600 distinct-mot_sm_unsm600 distinct-mot_unsm_unsm600 distinct-mot_sm_sm600_NoOverlap distinct-mot_sm_unsm600_NoOverlap distinct-mot_unsm_unsm600_NoOverlap


distinct600: distinct-aud600 distinct-vis600 distinct-mot600
distinct-aud600: distinct-aud_sm_sm600 distinct-aud_sm_unsm600 distinct-aud_unsm_unsm600 distinct-aud_sm_sm600_NoOverlap distinct-aud_sm_unsm600_NoOverlap distinct-aud_unsm_unsm600_NoOverlap
distinct-vis600: distinct-vis_sm_sm600 distinct-vis_sm_unsm600 distinct-vis_unsm_unsm600 distinct-vis_sm_sm600_NoOverlap distinct-vis_sm_unsm600_NoOverlap distinct-vis_unsm_unsm600_NoOverlap
distinct-mot600: distinct-mot_sm_sm600 distinct-mot_sm_unsm600 distinct-mot_unsm_unsm600 distinct-mot_sm_sm600_NoOverlap distinct-mot_sm_unsm600_NoOverlap distinct-mot_unsm_unsm600_NoOverlap
distinct-tact600: distinct-tact_sm_sm600 distinct-tact_sm_unsm600 distinct-tact_unsm_unsm600 distinct-tact_sm_sm600_NoOverlap distinct-tact_sm_unsm600_NoOverlap distinct-tact_unsm_unsm600_NoOverlap

distinct-aud_sm_sm600: auditory/distinct_sm_sm600.mat
distinct-aud_sm_unsm600: auditory/distinct_sm_unsm600.mat
distinct-aud_unsm_unsm600: auditory/distinct_unsm_unsm600.mat
distinct-aud_sm_sm600_NoOverlap: auditory/distinct_sm_sm600_NoOverlap.mat
distinct-aud_sm_unsm600_NoOverlap: auditory/distinct_sm_unsm600_NoOverlap.mat
distinct-aud_unsm_unsm600_NoOverlap: auditory/distinct_unsm_unsm600_NoOverlap.mat

distinct-vis_sm_sm600: visual/distinct_sm_sm600.mat
distinct-vis_sm_unsm600: visual/distinct_sm_unsm600.mat
distinct-vis_unsm_unsm600: visual/distinct_unsm_unsm600.mat
distinct-vis_sm_sm600_NoOverlap: visual/distinct_sm_sm600_NoOverlap.mat
distinct-vis_sm_unsm600_NoOverlap: visual/distinct_sm_unsm600_NoOverlap.mat
distinct-vis_unsm_unsm600_NoOverlap: visual/distinct_unsm_unsm600_NoOverlap.mat

distinct-mot_sm_sm600: motor/distinct_sm_sm600.mat
distinct-mot_sm_unsm600: motor/distinct_sm_unsm600.mat
distinct-mot_unsm_unsm600: motor/distinct_unsm_unsm600.mat
distinct-mot_sm_sm600_NoOverlap: motor/distinct_sm_sm600_NoOverlap.mat
distinct-mot_sm_unsm600_NoOverlap: motor/distinct_sm_unsm600_NoOverlap.mat
distinct-mot_unsm_unsm600_NoOverlap: motor/distinct_unsm_unsm600_NoOverlap.mat

distinct-tact_sm_sm600: tactile/distinct_sm_sm600.mat
distinct-tact_sm_unsm600: tactile/distinct_sm_unsm600.mat
distinct-tact_unsm_unsm600: tactile/distinct_unsm_unsm600.mat
distinct-tact_sm_sm600_NoOverlap: tactile/distinct_sm_sm600_NoOverlap.mat
distinct-tact_sm_unsm600_NoOverlap: tactile/distinct_sm_unsm600_NoOverlap.mat
distinct-tact_unsm_unsm600_NoOverlap: tactile/distinct_unsm_unsm600_NoOverlap.mat

auditory/distinct_sm_sm600.mat: auditory/funcmasked_sm_sm600.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm600.mat','distinct_sm_sm600.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_sm600.mat: visual/funcmasked_sm_sm600.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm600.mat','distinct_sm_sm600.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_sm600.mat: motor/funcmasked_sm_sm600.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm600.mat','distinct_sm_sm600.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_sm600.mat: tactile/funcmasked_sm_sm600.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm600.mat','distinct_sm_sm600.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_unsm600.mat: auditory/funcmasked_sm_unsm600.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm600.mat','distinct_sm_unsm600.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_unsm600.mat: visual/funcmasked_sm_unsm600.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm600.mat','distinct_sm_unsm600.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_unsm600.mat: motor/funcmasked_sm_unsm600.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm600.mat','distinct_sm_unsm600.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_unsm600.mat: tactile/funcmasked_sm_unsm600.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm600.mat','distinct_sm_unsm600.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_unsm_unsm600.mat: auditory/funcmasked_unsm_unsm600.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm600.mat','distinct_unsm_unsm600.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_unsm_unsm600.mat: visual/funcmasked_unsm_unsm600.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm600.mat','distinct_unsm_unsm600.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_unsm_unsm600.mat: motor/funcmasked_unsm_unsm600.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm600.mat','distinct_unsm_unsm600.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_unsm_unsm600.mat: tactile/funcmasked_unsm_unsm600.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm600.mat','distinct_unsm_unsm600.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_sm600_NoOverlap.mat: auditory/funcmasked_sm_sm600_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm600_NoOverlap.mat','distinct_sm_sm600_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_sm600_NoOverlap.mat: visual/funcmasked_sm_sm600_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm600_NoOverlap.mat','distinct_sm_sm600_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_sm600_NoOverlap.mat: motor/funcmasked_sm_sm600_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm600_NoOverlap.mat','distinct_sm_sm600_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_sm600_NoOverlap.mat: tactile/funcmasked_sm_sm600_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm600_NoOverlap.mat','distinct_sm_sm600_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_unsm600_NoOverlap.mat: auditory/funcmasked_sm_unsm600_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm600_NoOverlap.mat','distinct_sm_unsm600_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_unsm600_NoOverlap.mat: visual/funcmasked_sm_unsm600_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm600_NoOverlap.mat','distinct_sm_unsm600_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_unsm600_NoOverlap.mat: motor/funcmasked_sm_unsm600_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm600_NoOverlap.mat','distinct_sm_unsm600_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_unsm600_NoOverlap.mat: tactile/funcmasked_sm_unsm600_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm600_NoOverlap.mat','distinct_sm_unsm600_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_unsm_unsm600_NoOverlap.mat: auditory/funcmasked_unsm_unsm600_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm600_NoOverlap.mat','distinct_unsm_unsm600_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_unsm_unsm600_NoOverlap.mat: visual/funcmasked_unsm_unsm600_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm600_NoOverlap.mat','distinct_unsm_unsm600_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_unsm_unsm600_NoOverlap.mat: motor/funcmasked_unsm_unsm600_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm600_NoOverlap.mat','distinct_unsm_unsm600_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_unsm_unsm600_NoOverlap.mat: tactile/funcmasked_unsm_unsm600_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm600_NoOverlap.mat','distinct_unsm_unsm600_NoOverlap.mat'), catch, 'Error running corridff', end; exit"


auditory/funcmasked_sm_sm600.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemSm12conds.mat auditory/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_unsm600.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_unsm_unsm600.mat: auditory/LeftHemUnsm2conds.mat auditory/RightHemUnsm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_sm600.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemSm12conds.mat motor/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_unsm600.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_unsm_unsm600.mat: motor/LeftHemUnsm2conds.mat motor/RightHemUnsm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_sm600.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemSm12conds.mat visual/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_unsm600.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_unsm_unsm600.mat: visual/LeftHemUnsm2conds.mat visual/RightHemUnsm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_sm600.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemSm12conds.mat tactile/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_unsm600.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_unsm_unsm600.mat: tactile/LeftHemUnsm2conds.mat tactile/RightHemUnsm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_sm600_NoOverlap.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemSm12conds.mat auditory/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(400,600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_unsm600_NoOverlap.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(400,600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_unsm_unsm600_NoOverlap.mat: auditory/LeftHemUnsm2conds.mat auditory/RightHemUnsm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(400,600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_sm600_NoOverlap.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemSm12conds.mat motor/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(400,600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_unsm600_NoOverlap.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(400,600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_unsm_unsm600_NoOverlap.mat: motor/LeftHemUnsm2conds.mat motor/RightHemUnsm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(400,600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_sm600_NoOverlap.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemSm12conds.mat visual/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(400,600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_unsm600_NoOverlap.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(400,600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_unsm_unsm600_NoOverlap.mat: visual/LeftHemUnsm2conds.mat visual/RightHemUnsm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(400,600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_sm600_NoOverlap.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemSm12conds.mat tactile/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(400,600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_unsm600_NoOverlap.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(400,600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_unsm_unsm600_NoOverlap.mat: tactile/LeftHemUnsm2conds.mat tactile/RightHemUnsm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(400,600,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

.PHONY: saved5000 saved_aud5000 saved_vis5000 saved_mot5000 saved_tact5000

saved5000: saved_aud5000 saved_vis5000 saved_mot5000
saved_aud5000: saved_aud_sm_sm5000 saved_aud_sm_unsm5000 saved_aud_unsm_unsm5000 saved_aud_sm_sm5000_NoOverlap saved_aud_sm_unsm5000_NoOverlap saved_aud_unsm_unsm5000_NoOverlap
saved_vis5000: saved_vis_sm_sm5000 saved_vis_sm_unsm5000 saved_vis_unsm_unsm5000 saved_vis_sm_sm5000_NoOverlap saved_vis_sm_unsm5000_NoOverlap saved_vis_unsm_unsm5000_NoOverlap
saved_mot5000: saved_mot_sm_sm5000 saved_mot_sm_unsm5000 saved_mot_unsm_unsm5000 saved_mot_sm_sm5000_NoOverlap saved_mot_sm_unsm5000_NoOverlap saved_mot_unsm_unsm5000_NoOverlap
saved_tact5000: saved_tact_sm_sm5000 saved_tact_sm_unsm5000 saved_tact_unsm_unsm5000 saved_tact_sm_sm5000_NoOverlap saved_tact_sm_unsm5000_NoOverlap saved_tact_unsm_unsm5000_NoOverlap

saved_aud_sm_sm5000: auditory/distinct_sm_sm5000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_sm5000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_sm5000

saved_aud_sm_unsm5000: auditory/distinct_sm_unsm5000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_unsm5000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_unsm5000

saved_aud_unsm_unsm5000: auditory/distinct_unsm_unsm5000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_unsm_unsm5000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_unsm_unsm5000

saved_vis_sm_sm5000: visual/distinct_sm_sm5000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_sm5000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_sm5000

saved_vis_sm_unsm5000: visual/distinct_sm_unsm5000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_unsm5000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_unsm5000

saved_vis_unsm_unsm5000: visual/distinct_unsm_unsm5000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_unsm_unsm5000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_unsm_unsm5000

saved_mot_sm_sm5000: motor/distinct_sm_sm5000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_sm5000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_sm5000

saved_mot_sm_unsm5000: motor/distinct_sm_unsm5000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_unsm5000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_unsm5000

saved_mot_unsm_unsm5000: motor/distinct_unsm_unsm5000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_unsm_unsm5000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_unsm_unsm5000

saved_tact_sm_sm5000: tactile/distinct_sm_sm5000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_sm5000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_sm5000

saved_tact_sm_unsm5000: tactile/distinct_sm_unsm5000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_unsm5000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_unsm5000

saved_tact_unsm_unsm5000: tactile/distinct_unsm_unsm5000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_unsm_unsm5000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_unsm_unsm5000

saved_aud_sm_sm5000_NoOverlap: auditory/distinct_sm_sm5000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_sm5000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_sm5000_NoOverlap

saved_aud_sm_unsm5000_NoOverlap: auditory/distinct_sm_unsm5000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_unsm5000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_unsm5000_NoOverlap

saved_aud_unsm_unsm5000_NoOverlap: auditory/distinct_unsm_unsm5000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_unsm_unsm5000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_unsm_unsm5000_NoOverlap

saved_vis_sm_sm5000_NoOverlap: visual/distinct_sm_sm5000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_sm5000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_sm5000_NoOverlap

saved_vis_sm_unsm5000_NoOverlap: visual/distinct_sm_unsm5000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_unsm5000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_unsm5000_NoOverlap

saved_vis_unsm_unsm5000_NoOverlap: visual/distinct_unsm_unsm5000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_unsm_unsm5000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_unsm_unsm5000_NoOverlap

saved_mot_sm_sm5000_NoOverlap: motor/distinct_sm_sm5000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_sm5000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_sm5000_NoOverlap

saved_mot_sm_unsm5000_NoOverlap: motor/distinct_sm_unsm5000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_unsm5000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_unsm5000_NoOverlap

saved_mot_unsm_unsm5000_NoOverlap: motor/distinct_unsm_unsm5000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_unsm_unsm5000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_unsm_unsm5000_NoOverlap

saved_tact_sm_sm5000_NoOverlap: tactile/distinct_sm_sm5000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_sm5000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_sm5000_NoOverlap

saved_tact_sm_unsm5000_NoOverlap: tactile/distinct_sm_unsm5000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_unsm5000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_unsm5000_NoOverlap

saved_tact_unsm_unsm5000_NoOverlap: tactile/distinct_unsm_unsm5000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_unsm_unsm5000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_unsm_unsm5000_NoOverlap


.PHONY: distinct5000 distinct-aud5000 distinct-vis5000 distinct-mot5000 distinct-tact5000
.PHONY: distinct-aud_sm_sm5000 distinct-aud_sm_unsm5000 distinct-aud_unsm_unsm5000
.PHONY: distinct-vis_sm_sm5000 distinct-vis_sm_unsm5000 distinct-vis_unsm_unsm5000
.PHONY: distinct-mot_sm_sm5000 distinct-mot_sm_unsm5000 distinct-mot_unsm_unsm5000
.PHONY: distinct-tact_sm_sm5000 distinct-tact_sm_unsm5000 distinct-tact_unsm_unsm5000

distinct5000: distinct-aud5000 distinct-vis5000 distinct-mot5000
distinct-aud5000: distinct-aud_sm_sm5000 distinct-aud_sm_unsm5000 distinct-aud_unsm_unsm5000 distinct-aud_sm_sm5000_NoOverlap distinct-aud_sm_unsm5000_NoOverlap distinct-aud_unsm_unsm5000_NoOverlap
distinct-vis5000: distinct-vis_sm_sm5000 distinct-vis_sm_unsm5000 distinct-vis_unsm_unsm5000 distinct-vis_sm_sm5000_NoOverlap distinct-vis_sm_unsm5000_NoOverlap distinct-vis_unsm_unsm5000_NoOverlap
distinct-mot5000: distinct-mot_sm_sm5000 distinct-mot_sm_unsm5000 distinct-mot_unsm_unsm5000 distinct-mot_sm_sm5000_NoOverlap distinct-mot_sm_unsm5000_NoOverlap distinct-mot_unsm_unsm5000_NoOverlap
distinct-tact5000: distinct-tact_sm_sm5000 distinct-tact_sm_unsm5000 distinct-tact_unsm_unsm5000 distinct-tact_sm_sm5000_NoOverlap distinct-tact_sm_unsm5000_NoOverlap distinct-tact_unsm_unsm5000_NoOverlap

distinct-aud_sm_sm5000: auditory/distinct_sm_sm5000.mat
distinct-aud_sm_unsm5000: auditory/distinct_sm_unsm5000.mat
distinct-aud_unsm_unsm5000: auditory/distinct_unsm_unsm5000.mat
distinct-aud_sm_sm5000_NoOverlap: auditory/distinct_sm_sm5000_NoOverlap.mat
distinct-aud_sm_unsm5000_NoOverlap: auditory/distinct_sm_unsm5000_NoOverlap.mat
distinct-aud_unsm_unsm5000_NoOverlap: auditory/distinct_unsm_unsm5000_NoOverlap.mat

distinct-vis_sm_sm5000: visual/distinct_sm_sm5000.mat
distinct-vis_sm_unsm5000: visual/distinct_sm_unsm5000.mat
distinct-vis_unsm_unsm5000: visual/distinct_unsm_unsm5000.mat
distinct-vis_sm_sm5000_NoOverlap: visual/distinct_sm_sm5000_NoOverlap.mat
distinct-vis_sm_unsm5000_NoOverlap: visual/distinct_sm_unsm5000_NoOverlap.mat
distinct-vis_unsm_unsm5000_NoOverlap: visual/distinct_unsm_unsm5000_NoOverlap.mat

distinct-mot_sm_sm5000: motor/distinct_sm_sm5000.mat
distinct-mot_sm_unsm5000: motor/distinct_sm_unsm5000.mat
distinct-mot_unsm_unsm5000: motor/distinct_unsm_unsm5000.mat
distinct-mot_sm_sm5000_NoOverlap: motor/distinct_sm_sm5000_NoOverlap.mat
distinct-mot_sm_unsm5000_NoOverlap: motor/distinct_sm_unsm5000_NoOverlap.mat
distinct-mot_unsm_unsm5000_NoOverlap: motor/distinct_unsm_unsm5000_NoOverlap.mat

distinct-tact_sm_sm5000: tactile/distinct_sm_sm5000.mat
distinct-tact_sm_unsm5000: tactile/distinct_sm_unsm5000.mat
distinct-tact_unsm_unsm5000: tactile/distinct_unsm_unsm5000.mat
distinct-tact_sm_sm5000_NoOverlap: tactile/distinct_sm_sm5000_NoOverlap.mat
distinct-tact_sm_unsm5000_NoOverlap: tactile/distinct_sm_unsm5000_NoOverlap.mat
distinct-tact_unsm_unsm5000_NoOverlap: tactile/distinct_unsm_unsm5000_NoOverlap.mat

auditory/distinct_sm_sm5000.mat: auditory/funcmasked_sm_sm5000.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm5000.mat','distinct_sm_sm5000.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_sm5000.mat: visual/funcmasked_sm_sm5000.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm5000.mat','distinct_sm_sm5000.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_sm5000.mat: motor/funcmasked_sm_sm5000.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm5000.mat','distinct_sm_sm5000.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_sm5000.mat: tactile/funcmasked_sm_sm5000.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm5000.mat','distinct_sm_sm5000.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_unsm5000.mat: auditory/funcmasked_sm_unsm5000.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm5000.mat','distinct_sm_unsm5000.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_unsm5000.mat: visual/funcmasked_sm_unsm5000.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm5000.mat','distinct_sm_unsm5000.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_unsm5000.mat: motor/funcmasked_sm_unsm5000.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm5000.mat','distinct_sm_unsm5000.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_unsm5000.mat: tactile/funcmasked_sm_unsm5000.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm5000.mat','distinct_sm_unsm5000.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_unsm_unsm5000.mat: auditory/funcmasked_unsm_unsm5000.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm5000.mat','distinct_unsm_unsm5000.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_unsm_unsm5000.mat: visual/funcmasked_unsm_unsm5000.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm5000.mat','distinct_unsm_unsm5000.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_unsm_unsm5000.mat: motor/funcmasked_unsm_unsm5000.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm5000.mat','distinct_unsm_unsm5000.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_unsm_unsm5000.mat: tactile/funcmasked_unsm_unsm5000.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm5000.mat','distinct_unsm_unsm5000.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_sm5000_NoOverlap.mat: auditory/funcmasked_sm_sm5000_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm5000_NoOverlap.mat','distinct_sm_sm5000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_sm5000_NoOverlap.mat: visual/funcmasked_sm_sm5000_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm5000_NoOverlap.mat','distinct_sm_sm5000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_sm5000_NoOverlap.mat: motor/funcmasked_sm_sm5000_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm5000_NoOverlap.mat','distinct_sm_sm5000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_sm5000_NoOverlap.mat: tactile/funcmasked_sm_sm5000_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm5000_NoOverlap.mat','distinct_sm_sm5000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_unsm5000_NoOverlap.mat: auditory/funcmasked_sm_unsm5000_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm5000_NoOverlap.mat','distinct_sm_unsm5000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_unsm5000_NoOverlap.mat: visual/funcmasked_sm_unsm5000_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm5000_NoOverlap.mat','distinct_sm_unsm5000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_unsm5000_NoOverlap.mat: motor/funcmasked_sm_unsm5000_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm5000.mat','distinct_sm_unsm5000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_unsm5000_NoOverlap.mat: tactile/funcmasked_sm_unsm5000_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm5000_NoOverlap.mat','distinct_sm_unsm5000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_unsm_unsm5000_NoOverlap.mat: auditory/funcmasked_unsm_unsm5000_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm5000_NoOverlap.mat','distinct_unsm_unsm5000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_unsm_unsm5000_NoOverlap.mat: visual/funcmasked_unsm_unsm5000_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm5000_NoOverlap.mat','distinct_unsm_unsm5000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_unsm_unsm5000_NoOverlap.mat: motor/funcmasked_unsm_unsm5000_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm5000_NoOverlap.mat','distinct_unsm_unsm5000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_unsm_unsm5000_NoOverlap.mat: tactile/funcmasked_unsm_unsm5000_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm5000_NoOverlap.mat','distinct_unsm_unsm5000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"


auditory/funcmasked_sm_sm5000.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemSm12conds.mat auditory/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_unsm5000.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_unsm_unsm5000.mat: auditory/LeftHemUnsm2conds.mat auditory/RightHemUnsm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_sm5000.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemSm12conds.mat motor/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_unsm5000.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_unsm_unsm5000.mat: motor/LeftHemUnsm2conds.mat motor/RightHemUnsm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_sm5000.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemSm12conds.mat visual/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_unsm5000.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_unsm_unsm5000.mat: visual/LeftHemUnsm2conds.mat visual/RightHemUnsm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_sm5000.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemSm12conds.mat tactile/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_unsm5000.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_unsm_unsm5000.mat: tactile/LeftHemUnsm2conds.mat tactile/RightHemUnsm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_sm5000_NoOverlap.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemSm12conds.mat auditory/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(2000,5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_unsm5000_NoOverlap.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(2000,5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_unsm_unsm5000_NoOverlap.mat: auditory/LeftHemUnsm2conds.mat auditory/RightHemUnsm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(2000,5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_sm5000_NoOverlap.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemSm12conds.mat motor/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(2000,5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_unsm5000_NoOverlap.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(2000,5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_unsm_unsm5000_NoOverlap.mat: motor/LeftHemUnsm2conds.mat motor/RightHemUnsm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(2000,5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_sm5000_NoOverlap.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemSm12conds.mat visual/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(2000,5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_unsm5000_NoOverlap.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(2000,5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_unsm_unsm5000_NoOverlap.mat: visual/LeftHemUnsm2conds.mat visual/RightHemUnsm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(2000,5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_sm5000_NoOverlap.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemSm12conds.mat tactile/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(2000,5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_unsm5000_NoOverlap.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(2000,5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_unsm_unsm5000_NoOverlap.mat: tactile/LeftHemUnsm2conds.mat tactile/RightHemUnsm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(2000,5000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

.PHONY: saved10000 saved_aud10000 saved_vis10000 saved_mot10000 saved_tact10000

saved10000: saved_aud10000 saved_vis10000 saved_mot10000
saved_aud10000: saved_aud_sm_sm10000 saved_aud_sm_unsm10000 saved_aud_unsm_unsm10000 saved_aud_sm_sm10000_NoOverlap saved_aud_sm_unsm10000_NoOverlap saved_aud_unsm_unsm10000_NoOverlap
saved_vis10000: saved_vis_sm_sm10000 saved_vis_sm_unsm10000 saved_vis_unsm_unsm10000 saved_vis_sm_sm10000_NoOverlap saved_vis_sm_unsm10000_NoOverlap saved_vis_unsm_unsm10000_NoOverlap
saved_mot10000: saved_mot_sm_sm10000 saved_mot_sm_unsm10000 saved_mot_unsm_unsm10000 saved_mot_sm_sm10000_NoOverlap saved_mot_sm_unsm10000_NoOverlap saved_mot_unsm_unsm10000_NoOverlap
saved_tact10000: saved_tact_sm_sm10000 saved_tact_sm_unsm10000 saved_tact_unsm_unsm10000 saved_tact_sm_sm10000_NoOverlap saved_tact_sm_unsm10000_NoOverlap saved_tact_unsm_unsm10000_NoOverlap

saved_aud_sm_sm10000: auditory/distinct_sm_sm10000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_sm10000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_sm10000

saved_aud_sm_unsm10000: auditory/distinct_sm_unsm10000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_unsm10000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_unsm10000

saved_aud_unsm_unsm10000: auditory/distinct_unsm_unsm10000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_unsm_unsm10000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_unsm_unsm10000

saved_vis_sm_sm10000: visual/distinct_sm_sm10000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_sm10000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_sm10000

saved_vis_sm_unsm10000: visual/distinct_sm_unsm10000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_unsm10000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_unsm10000

saved_vis_unsm_unsm10000: visual/distinct_unsm_unsm10000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_unsm_unsm10000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_unsm_unsm10000

saved_mot_sm_sm10000: motor/distinct_sm_sm10000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_sm10000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_sm10000

saved_mot_sm_unsm10000: motor/distinct_sm_unsm10000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_unsm10000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_unsm10000

saved_mot_unsm_unsm10000: motor/distinct_unsm_unsm10000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_unsm_unsm10000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_unsm_unsm10000

saved_tact_sm_sm10000: tactile/distinct_sm_sm10000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_sm10000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_sm10000

saved_tact_sm_unsm10000: tactile/distinct_sm_unsm10000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_unsm10000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_unsm10000

saved_tact_unsm_unsm10000: tactile/distinct_unsm_unsm10000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_unsm_unsm10000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_unsm_unsm10000

saved_aud_sm_sm10000_NoOverlap: auditory/distinct_sm_sm10000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_sm10000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_sm10000_NoOverlap

saved_aud_sm_unsm10000_NoOverlap: auditory/distinct_sm_unsm10000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_unsm10000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_unsm10000_NoOverlap

saved_aud_unsm_unsm10000_NoOverlap: auditory/distinct_unsm_unsm10000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_unsm_unsm10000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_unsm_unsm10000_NoOverlap

saved_vis_sm_sm10000_NoOverlap: visual/distinct_sm_sm10000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_sm10000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_sm10000_NoOverlap

saved_vis_sm_unsm10000_NoOverlap: visual/distinct_sm_unsm10000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_unsm10000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_unsm10000_NoOverlap

saved_vis_unsm_unsm10000_NoOverlap: visual/distinct_unsm_unsm10000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_unsm_unsm10000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_unsm_unsm10000_NoOverlap

saved_mot_sm_sm10000_NoOverlap: motor/distinct_sm_sm10000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_sm10000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_sm10000_NoOverlap

saved_mot_sm_unsm10000_NoOverlap: motor/distinct_sm_unsm10000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_unsm10000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_unsm10000_NoOverlap

saved_mot_unsm_unsm10000_NoOverlap: motor/distinct_unsm_unsm10000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_unsm_unsm10000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_unsm_unsm10000_NoOverlap

saved_tact_sm_sm10000_NoOverlap: tactile/distinct_sm_sm10000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_sm10000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_sm10000_NoOverlap

saved_tact_sm_unsm10000_NoOverlap: tactile/distinct_sm_unsm10000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_unsm10000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_unsm10000_NoOverlap

saved_tact_unsm_unsm10000_NoOverlap: tactile/distinct_unsm_unsm10000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_unsm_unsm10000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_unsm_unsm10000_NoOverlap


.PHONY: distinct10000 distinct-aud10000 distinct-vis10000 distinct-mot10000 distinct-tact10000 
.PHONY: distinct-aud_sm_sm10000 distinct-aud_sm_unsm10000 distinct-aud_unsm_unsm10000 distinct-aud_sm_sm10000_NoOverlap distinct-aud_sm_unsm10000_NoOverlap distinct-aud_unsm_unsm10000_NoOverlap
.PHONY: distinct-vis_sm_sm10000 distinct-vis_sm_unsm10000 distinct-vis_unsm_unsm10000 distinct-vis_sm_sm10000_NoOverlap distinct-vis_sm_unsm10000_NoOverlap distinct-vis_unsm_unsm10000_NoOverlap
.PHONY: distinct-mot_sm_sm10000 distinct-mot_sm_unsm10000 distinct-mot_unsm_unsm10000 distinct-mot_sm_sm10000_NoOverlap distinct-mot_sm_unsm10000_NoOverlap distinct-mot_unsm_unsm10000_NoOverlap
.PHONY: distinct-tact_sm_sm10000 distinct-tact_sm_unsm10000 distinct-tact_unsm_unsm10000 distinct-tact_sm_sm10000_NoOverlap distinct-tact_sm_unsm10000_NoOverlap distinct-tact_unsm_unsm10000_NoOverlap


distinct10000: distinct-aud10000 distinct-vis10000 distinct-mot10000
distinct-aud10000: distinct-aud_sm_sm10000 distinct-aud_sm_unsm10000 distinct-aud_unsm_unsm10000 distinct-aud_sm_sm10000_NoOverlap distinct-aud_sm_unsm10000_NoOverlap distinct-aud_unsm_unsm10000_NoOverlap
distinct-vis10000: distinct-vis_sm_sm10000 distinct-vis_sm_unsm10000 distinct-vis_unsm_unsm10000 distinct-vis_sm_sm10000_NoOverlap distinct-vis_sm_unsm10000_NoOverlap distinct-vis_unsm_unsm10000_NoOverlap 
distinct-mot10000: distinct-mot_sm_sm10000 distinct-mot_sm_unsm10000 distinct-mot_unsm_unsm10000 distinct-mot_sm_sm10000_NoOverlap distinct-mot_sm_unsm10000_NoOverlap distinct-mot_unsm_unsm10000_NoOverlap
distinct-tact10000: distinct-tact_sm_sm10000 distinct-tact_sm_unsm10000 distinct-tact_unsm_unsm10000 distinct-tact_sm_sm10000_NoOverlap distinct-tact_sm_unsm10000_NoOverlap distinct-tact_unsm_unsm10000_NoOverlap

.PHONY: distinct-aud1800
distinct-aud1800:auditory/distinct_sm_sm1800.mat auditory/classify_auditory1800.mat

distinct-aud_sm_sm10000: auditory/distinct_sm_sm10000.mat
distinct-aud_sm_unsm10000: auditory/distinct_sm_unsm10000.mat
distinct-aud_unsm_unsm10000: auditory/distinct_unsm_unsm10000.mat
distinct-aud_sm_sm10000_NoOverlap: auditory/distinct_sm_sm10000_NoOverlap.mat
distinct-aud_sm_unsm10000_NoOverlap: auditory/distinct_sm_unsm10000_NoOverlap.mat
distinct-aud_unsm_unsm10000_NoOverlap: auditory/distinct_unsm_unsm10000_NoOverlap.mat

distinct-vis_sm_sm10000: visual/distinct_sm_sm10000.mat
distinct-vis_sm_unsm10000: visual/distinct_sm_unsm10000.mat
distinct-vis_unsm_unsm10000: visual/distinct_unsm_unsm10000.mat
distinct-vis_sm_sm10000_NoOverlap: visual/distinct_sm_sm10000_NoOverlap.mat
distinct-vis_sm_unsm10000_NoOverlap: visual/distinct_sm_unsm10000_NoOverlap.mat
distinct-vis_unsm_unsm10000_NoOverlap: visual/distinct_unsm_unsm10000_NoOverlap.mat

distinct-mot_sm_sm10000: motor/distinct_sm_sm10000.mat
distinct-mot_sm_unsm10000: motor/distinct_sm_unsm10000.mat
distinct-mot_unsm_unsm10000: motor/distinct_unsm_unsm10000.mat
distinct-mot_sm_sm10000_NoOverlap: motor/distinct_sm_sm10000_NoOverlap.mat
distinct-mot_sm_unsm10000_NoOverlap: motor/distinct_sm_unsm10000_NoOverlap.mat
distinct-mot_unsm_unsm10000_NoOverlap: motor/distinct_unsm_unsm10000_NoOverlap.mat

distinct-tact_sm_sm10000: tactile/distinct_sm_sm10000.mat
distinct-tact_sm_unsm10000: tactile/distinct_sm_unsm10000.mat
distinct-tact_unsm_unsm10000: tactile/distinct_unsm_unsm10000.mat
distinct-tact_sm_sm10000_NoOverlap: tactile/distinct_sm_sm10000_NoOverlap.mat
distinct-tact_sm_unsm10000_NoOverlap: tactile/distinct_sm_unsm10000_NoOverlap.mat
distinct-tact_unsm_unsm10000_NoOverlap: tactile/distinct_unsm_unsm10000_NoOverlap.mat

auditory/distinct_sm_sm1800.mat:auditory/funcmasked_sm_sm1800.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm1800.mat','distinct_sm_sm1800.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_sm10000.mat: auditory/funcmasked_sm_sm10000.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm10000.mat','distinct_sm_sm10000.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_sm10000.mat: visual/funcmasked_sm_sm10000.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm10000.mat','distinct_sm_sm10000.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_sm10000.mat: motor/funcmasked_sm_sm10000.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm10000.mat','distinct_sm_sm10000.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_sm10000.mat: tactile/funcmasked_sm_sm10000.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm10000.mat','distinct_sm_sm10000.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_unsm10000.mat: auditory/funcmasked_sm_unsm10000.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm10000.mat','distinct_sm_unsm10000.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_unsm10000.mat: visual/funcmasked_sm_unsm10000.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm10000.mat','distinct_sm_unsm10000.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_unsm10000.mat: motor/funcmasked_sm_unsm10000.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm10000.mat','distinct_sm_unsm10000.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_unsm10000.mat: tactile/funcmasked_sm_unsm10000.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm10000.mat','distinct_sm_unsm10000.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_unsm_unsm10000.mat: auditory/funcmasked_unsm_unsm10000.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm10000.mat','distinct_unsm_unsm10000.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_unsm_unsm10000.mat: visual/funcmasked_unsm_unsm10000.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm10000.mat','distinct_unsm_unsm10000.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_unsm_unsm10000.mat: motor/funcmasked_unsm_unsm10000.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm10000.mat','distinct_unsm_unsm10000.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_unsm_unsm10000.mat: tactile/funcmasked_unsm_unsm10000.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm10000.mat','distinct_unsm_unsm10000.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_sm10000_NoOverlap.mat: auditory/funcmasked_sm_sm10000_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm10000_NoOverlap.mat','distinct_sm_sm10000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_sm10000_NoOverlap.mat: visual/funcmasked_sm_sm10000_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm10000_NoOverlap.mat','distinct_sm_sm10000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_sm10000_NoOverlap.mat: motor/funcmasked_sm_sm10000_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm10000_NoOverlap.mat','distinct_sm_sm10000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_sm10000_NoOverlap.mat: tactile/funcmasked_sm_sm10000_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm10000_NoOverlap.mat','distinct_sm_sm10000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_unsm10000_NoOverlap.mat: auditory/funcmasked_sm_unsm10000_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm10000_NoOverlap.mat','distinct_sm_unsm10000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_unsm10000_NoOverlap.mat: visual/funcmasked_sm_unsm10000_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm10000_NoOverlap.mat','distinct_sm_unsm10000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_unsm10000_NoOverlap.mat: motor/funcmasked_sm_unsm10000_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm10000_NoOverlap.mat','distinct_sm_unsm10000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_unsm10000_NoOverlap.mat: tactile/funcmasked_sm_unsm10000_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm10000_NoOverlap.mat','distinct_sm_unsm10000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_unsm_unsm10000_NoOverlap.mat: auditory/funcmasked_unsm_unsm10000_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm10000_NoOverlap.mat','distinct_unsm_unsm10000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_unsm_unsm10000_NoOverlap.mat: visual/funcmasked_unsm_unsm10000_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm10000_NoOverlap.mat','distinct_unsm_unsm10000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_unsm_unsm10000_NoOverlap.mat: motor/funcmasked_unsm_unsm10000_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm10000_NoOverlap.mat','distinct_unsm_unsm10000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_unsm_unsm10000_NoOverlap.mat: tactile/funcmasked_unsm_unsm10000_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm10000_NoOverlap.mat','distinct_unsm_unsm10000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

auditory/funcmasked_sm_sm1800.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemSm12conds.mat auditory/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(1800,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_sm10000.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemSm12conds.mat auditory/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_unsm10000.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_unsm_unsm10000.mat: auditory/LeftHemUnsm2conds.mat auditory/RightHemUnsm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_sm10000.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemSm12conds.mat motor/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_unsm10000.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_unsm_unsm10000.mat: motor/LeftHemUnsm2conds.mat motor/RightHemUnsm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_sm10000.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemSm12conds.mat visual/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_unsm10000.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_unsm_unsm10000.mat: visual/LeftHemUnsm2conds.mat visual/RightHemUnsm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_sm10000.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemSm12conds.mat tactile/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_unsm10000.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_unsm_unsm10000.mat: tactile/LeftHemUnsm2conds.mat tactile/RightHemUnsm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_sm10000_NoOverlap.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemSm12conds.mat auditory/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(5000,10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_unsm10000_NoOverlap.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(5000,10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_unsm_unsm10000_NoOverlap.mat: auditory/LeftHemUnsm2conds.mat auditory/RightHemUnsm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(5000,10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_sm10000_NoOverlap.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemSm12conds.mat motor/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(5000,10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_unsm10000_NoOverlap.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(5000,10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_unsm_unsm10000_NoOverlap.mat: motor/LeftHemUnsm2conds.mat motor/RightHemUnsm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(5000,10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_sm10000_NoOverlap.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemSm12conds.mat visual/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(5000,10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_unsm10000_NoOverlap.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(5000,10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_unsm_unsm10000_NoOverlap.mat: visual/LeftHemUnsm2conds.mat visual/RightHemUnsm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(5000,10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_sm10000_NoOverlap.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemSm12conds.mat tactile/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(5000,10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_unsm10000_NoOverlap.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(5000,10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_unsm_unsm10000_NoOverlap.mat: tactile/LeftHemUnsm2conds.mat tactile/RightHemUnsm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(5000,10000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

.PHONY: saved1000 saved_aud1000 saved_vis1000 saved_mot1000 saved_tact1000

saved1000: saved_aud1000 saved_vis1000 saved_mot1000
saved_aud1000: saved_aud_sm_sm1000 saved_aud_sm_unsm1000 saved_aud_unsm_unsm1000 saved_aud_sm_sm1000_NoOverlap saved_aud_sm_unsm1000_NoOverlap saved_aud_unsm_unsm1000_NoOverlap
saved_vis1000: saved_vis_sm_sm1000 saved_vis_sm_unsm1000 saved_vis_unsm_unsm1000 saved_vis_sm_sm1000_NoOverlap saved_vis_sm_unsm1000_NoOverlap saved_vis_unsm_unsm1000_NoOverlap
saved_mot1000: saved_mot_sm_sm1000 saved_mot_sm_unsm1000 saved_mot_unsm_unsm1000 saved_mot_sm_sm1000_NoOverlap saved_mot_sm_unsm1000_NoOverlap saved_mot_unsm_unsm1000_NoOverlap
saved_tact1000: saved_tact_sm_sm1000 saved_tact_sm_unsm1000 saved_tact_unsm_unsm1000 saved_tact_sm_sm1000_NoOverlap saved_tact_sm_unsm1000_NoOverlap saved_tact_unsm_unsm1000_NoOverlap

saved_aud_sm_sm1000: auditory/distinct_sm_sm1000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_sm1000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_sm1000

saved_aud_sm_unsm1000: auditory/distinct_sm_unsm1000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_unsm1000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_unsm1000

saved_aud_unsm_unsm1000: auditory/distinct_unsm_unsm1000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_unsm_unsm1000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_unsm_unsm1000

saved_vis_sm_sm1000: visual/distinct_sm_sm1000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_sm1000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_sm1000

saved_vis_sm_unsm1000: visual/distinct_sm_unsm1000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_unsm1000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_unsm1000

saved_vis_unsm_unsm1000: visual/distinct_unsm_unsm1000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_unsm_unsm1000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_unsm_unsm1000

saved_mot_sm_sm1000: motor/distinct_sm_sm1000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_sm1000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_sm1000

saved_mot_sm_unsm1000: motor/distinct_sm_unsm1000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_unsm1000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_unsm1000

saved_mot_unsm_unsm1000: motor/distinct_unsm_unsm1000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_unsm_unsm1000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_unsm_unsm1000

saved_tact_sm_sm1000: tactile/distinct_sm_sm1000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_sm1000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_sm1000

saved_tact_sm_unsm1000: tactile/distinct_sm_unsm1000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_unsm1000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_unsm1000

saved_tact_unsm_unsm1000: tactile/distinct_unsm_unsm1000.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_unsm_unsm1000.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_unsm_unsm1000

saved_aud_sm_sm1000_NoOverlap: auditory/distinct_sm_sm1000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_sm1000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_sm1000_NoOverlap

saved_aud_sm_unsm1000_NoOverlap: auditory/distinct_sm_unsm1000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_unsm1000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_unsm1000_NoOverlap

saved_aud_unsm_unsm1000_NoOverlap: auditory/distinct_unsm_unsm1000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_unsm_unsm1000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_unsm_unsm1000_NoOverlap

saved_vis_sm_sm1000_NoOverlap: visual/distinct_sm_sm1000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_sm1000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_sm1000_NoOverlap

saved_vis_sm_unsm1000_NoOverlap: visual/distinct_sm_unsm1000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_unsm1000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_unsm1000_NoOverlap

saved_vis_unsm_unsm1000_NoOverlap: visual/distinct_unsm_unsm1000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_unsm_unsm1000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_unsm_unsm1000_NoOverlap

saved_mot_sm_sm1000_NoOverlap: motor/distinct_sm_sm1000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_sm1000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_sm1000_NoOverlap

saved_mot_sm_unsm1000_NoOverlap: motor/distinct_sm_unsm1000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_unsm1000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_unsm1000_NoOverlap

saved_mot_unsm_unsm1000_NoOverlap: motor/distinct_unsm_unsm1000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_unsm_unsm1000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_unsm_unsm1000_NoOverlap

saved_tact_sm_sm1000_NoOverlap: tactile/distinct_sm_sm1000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_sm1000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_sm1000_NoOverlap

saved_tact_sm_unsm1000_NoOverlap: tactile/distinct_sm_unsm1000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_unsm1000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_unsm1000_NoOverlap

saved_tact_unsm_unsm1000_NoOverlap: tactile/distinct_unsm_unsm1000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_unsm_unsm1000_NoOverlap.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_unsm_unsm1000_NoOverlap


.PHONY: distinct1000 distinct-aud1000 distinct-vis1000 distinct-mot1000 distinct-tact1000
.PHONY: distinct-aud_sm_sm1000 distinct-aud_sm_unsm1000 distinct-aud_unsm_unsm1000
.PHONY: distinct-vis_sm_sm1000 distinct-vis_sm_unsm1000 distinct-vis_unsm_unsm1000
.PHONY: distinct-mot_sm_sm1000 distinct-mot_sm_unsm1000 distinct-mot_unsm_unsm1000
.PHONY: distinct-tact_sm_sm1000 distinct-tact_sm_unsm1000 distinct-tact_unsm_unsm1000

distinct1000: distinct-aud1000 distinct-vis1000 distinct-mot1000
distinct-aud1000: distinct-aud_sm_sm1000 distinct-aud_sm_unsm1000 distinct-aud_unsm_unsm1000 distinct-aud_sm_sm1000_NoOverlap distinct-aud_sm_unsm1000_NoOverlap distinct-aud_unsm_unsm1000_NoOverlap
distinct-vis1000: distinct-vis_sm_sm1000 distinct-vis_sm_unsm1000 distinct-vis_unsm_unsm1000 distinct-vis_sm_sm1000_NoOverlap distinct-vis_sm_unsm1000_NoOverlap distinct-vis_unsm_unsm1000_NoOverlap
distinct-mot1000: distinct-mot_sm_sm1000 distinct-mot_sm_unsm1000 distinct-mot_unsm_unsm1000 distinct-mot_sm_sm1000_NoOverlap distinct-mot_sm_unsm1000_NoOverlap distinct-mot_unsm_unsm1000_NoOverlap
distinct-tact1000: distinct-tact_sm_sm1000 distinct-tact_sm_unsm1000 distinct-tact_unsm_unsm1000 distinct-tact_sm_sm1000_NoOverlap distinct-tact_sm_unsm1000_NoOverlap distinct-tact_unsm_unsm1000_NoOverlap

distinct-aud_sm_sm1000: auditory/distinct_sm_sm1000.mat
distinct-aud_sm_unsm1000: auditory/distinct_sm_unsm1000.mat
distinct-aud_unsm_unsm1000: auditory/distinct_unsm_unsm1000.mat
distinct-aud_sm_sm1000_NoOverlap: auditory/distinct_sm_sm1000_NoOverlap.mat
distinct-aud_sm_unsm1000_NoOverlap: auditory/distinct_sm_unsm1000_NoOverlap.mat
distinct-aud_unsm_unsm1000_NoOverlap: auditory/distinct_unsm_unsm1000_NoOverlap.mat

distinct-vis_sm_sm1000: visual/distinct_sm_sm1000.mat
distinct-vis_sm_unsm1000: visual/distinct_sm_unsm1000.mat
distinct-vis_unsm_unsm1000: visual/distinct_unsm_unsm1000.mat
distinct-vis_sm_sm1000_NoOverlap: visual/distinct_sm_sm1000_NoOverlap.mat
distinct-vis_sm_unsm1000_NoOverlap: visual/distinct_sm_unsm1000_NoOverlap.mat
distinct-vis_unsm_unsm1000_NoOverlap: visual/distinct_unsm_unsm1000_NoOverlap.mat

distinct-mot_sm_sm1000: motor/distinct_sm_sm1000.mat
distinct-mot_sm_unsm1000: motor/distinct_sm_unsm1000.mat
distinct-mot_unsm_unsm1000: motor/distinct_unsm_unsm1000.mat
distinct-mot_sm_sm1000_NoOverlap: motor/distinct_sm_sm1000_NoOverlap.mat
distinct-mot_sm_unsm1000_NoOverlap: motor/distinct_sm_unsm1000_NoOverlap.mat
distinct-mot_unsm_unsm1000_NoOverlap: motor/distinct_unsm_unsm1000_NoOverlap.mat

distinct-tact_sm_sm1000: tactile/distinct_sm_sm1000.mat
distinct-tact_sm_unsm1000: tactile/distinct_sm_unsm1000.mat
distinct-tact_unsm_unsm1000: tactile/distinct_unsm_unsm1000.mat
distinct-tact_sm_sm1000_NoOverlap: tactile/distinct_sm_sm1000_NoOverlap.mat
distinct-tact_sm_unsm1000_NoOverlap: tactile/distinct_sm_unsm1000_NoOverlap.mat
distinct-tact_unsm_unsm1000_NoOverlap: tactile/distinct_unsm_unsm1000_NoOverlap.mat

auditory/distinct_sm_sm1000.mat: auditory/funcmasked_sm_sm1000.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm1000.mat','distinct_sm_sm1000.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_sm1000.mat: visual/funcmasked_sm_sm1000.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm1000.mat','distinct_sm_sm1000.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_sm1000.mat: motor/funcmasked_sm_sm1000.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm1000.mat','distinct_sm_sm1000.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_sm1000.mat: tactile/funcmasked_sm_sm1000.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm1000.mat','distinct_sm_sm1000.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_unsm1000.mat: auditory/funcmasked_sm_unsm1000.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm1000.mat','distinct_sm_unsm1000.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_unsm1000.mat: visual/funcmasked_sm_unsm1000.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm1000.mat','distinct_sm_unsm1000.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_unsm1000.mat: motor/funcmasked_sm_unsm1000.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm1000.mat','distinct_sm_unsm1000.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_unsm1000.mat: tactile/funcmasked_sm_unsm1000.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm1000.mat','distinct_sm_unsm1000.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_unsm_unsm1000.mat: auditory/funcmasked_unsm_unsm1000.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm1000.mat','distinct_unsm_unsm1000.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_unsm_unsm1000.mat: visual/funcmasked_unsm_unsm1000.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm1000.mat','distinct_unsm_unsm1000.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_unsm_unsm1000.mat: motor/funcmasked_unsm_unsm1000.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm1000.mat','distinct_unsm_unsm1000.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_unsm_unsm1000.mat: tactile/funcmasked_unsm_unsm1000.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm1000.mat','distinct_unsm_unsm1000.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_sm1000_NoOverlap.mat: auditory/funcmasked_sm_sm1000_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm1000_NoOverlap.mat','distinct_sm_sm1000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_sm1000_NoOverlap.mat: visual/funcmasked_sm_sm1000_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm1000_NoOverlap.mat','distinct_sm_sm1000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_sm1000_NoOverlap.mat: motor/funcmasked_sm_sm1000_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm1000_NoOverlap.mat','distinct_sm_sm1000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_sm1000_NoOverlap.mat: tactile/funcmasked_sm_sm1000_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm1000_NoOverlap.mat','distinct_sm_sm1000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_unsm1000_NoOverlap.mat: auditory/funcmasked_sm_unsm1000_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm1000_NoOverlap.mat','distinct_sm_unsm1000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_unsm1000_NoOverlap.mat: visual/funcmasked_sm_unsm1000_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm1000_NoOverlap.mat','distinct_sm_unsm1000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_unsm1000_NoOverlap.mat: motor/funcmasked_sm_unsm1000_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm1000_NoOverlap.mat','distinct_sm_unsm1000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_unsm1000_NoOverlap.mat: tactile/funcmasked_sm_unsm1000_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm1000_NoOverlap.mat','distinct_sm_unsm1000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_unsm_unsm1000_NoOverlap.mat: auditory/funcmasked_unsm_unsm1000_NoOverlap.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm1000_NoOverlap.mat','distinct_unsm_unsm1000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_unsm_unsm1000_NoOverlap.mat: visual/funcmasked_unsm_unsm1000_NoOverlap.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm1000_NoOverlap.mat','distinct_unsm_unsm1000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_unsm_unsm1000_NoOverlap.mat: motor/funcmasked_unsm_unsm1000_NoOverlap.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm1000_NoOverlap.mat','distinct_unsm_unsm1000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_unsm_unsm1000_NoOverlap.mat: tactile/funcmasked_unsm_unsm1000_NoOverlap.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm1000_NoOverlap.mat','distinct_unsm_unsm1000_NoOverlap.mat'), catch, 'Error running corridff', end; exit"


auditory/funcmasked_sm_sm1000.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemSm12conds.mat auditory/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_unsm1000.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_unsm_unsm1000.mat: auditory/LeftHemUnsm2conds.mat auditory/RightHemUnsm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_sm1000.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemSm12conds.mat motor/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_unsm1000.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_unsm_unsm1000.mat: motor/LeftHemUnsm2conds.mat motor/RightHemUnsm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_sm1000.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemSm12conds.mat visual/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_unsm1000.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_unsm_unsm1000.mat: visual/LeftHemUnsm2conds.mat visual/RightHemUnsm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_sm1000.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemSm12conds.mat tactile/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_unsm1000.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_unsm_unsm1000.mat: tactile/LeftHemUnsm2conds.mat tactile/RightHemUnsm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"


auditory/funcmasked_sm_sm1000_NoOverlap.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemSm12conds.mat auditory/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(600,1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_unsm1000_NoOverlap.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(600,1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_unsm_unsm1000_NoOverlap.mat: auditory/LeftHemUnsm2conds.mat auditory/RightHemUnsm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(600,1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_sm1000_NoOverlap.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemSm12conds.mat motor/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(600,1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_unsm1000_NoOverlap.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(600,1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_unsm_unsm1000_NoOverlap.mat: motor/LeftHemUnsm2conds.mat motor/RightHemUnsm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(600,1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_sm1000_NoOverlap.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemSm12conds.mat visual/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(600,1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_unsm1000_NoOverlap.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(600,1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_unsm_unsm1000_NoOverlap.mat: visual/LeftHemUnsm2conds.mat visual/RightHemUnsm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(600,1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_sm1000_NoOverlap.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemSm12conds.mat tactile/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(600,1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_unsm1000_NoOverlap.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(600,1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_unsm_unsm1000_NoOverlap.mat: tactile/LeftHemUnsm2conds.mat tactile/RightHemUnsm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmaskOverlapRemoved(600,1000,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"




.PHONY: saved50 saved_aud50 saved_vis50 saved_mot50 saved_tact50

saved50: saved_aud50 saved_vis50 saved_mot50
saved_aud50: saved_aud_sm_sm50 saved_aud_sm_unsm50 saved_aud_unsm_unsm50
saved_vis50: saved_vis_sm_sm50 saved_vis_sm_unsm50 saved_vis_unsm_unsm50
saved_mot50: saved_mot_sm_sm50 saved_mot_sm_unsm50 saved_mot_unsm_unsm50
saved_tact50: saved_tact_sm_sm50 saved_tact_sm_unsm50 saved_tact_unsm_unsm50

saved_aud_sm_sm50: auditory/distinct_sm_sm50.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_sm50.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_sm50

saved_aud_sm_unsm50: auditory/distinct_sm_unsm50.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_sm_unsm50.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_sm_unsm50

saved_aud_unsm_unsm50: auditory/distinct_unsm_unsm50.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/aud_unsm_unsm50.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_aud_unsm_unsm50

saved_vis_sm_sm50: visual/distinct_sm_sm50.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_sm50.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_sm50

saved_vis_sm_unsm50: visual/distinct_sm_unsm50.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_sm_unsm50.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_sm_unsm50

saved_vis_unsm_unsm50: visual/distinct_unsm_unsm50.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/vis_unsm_unsm50.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_vis_unsm_unsm50

saved_mot_sm_sm50: motor/distinct_sm_sm50.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_sm50.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_sm50

saved_mot_sm_unsm50: motor/distinct_sm_unsm50.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_sm_unsm50.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_sm_unsm50

saved_mot_unsm_unsm50: motor/distinct_unsm_unsm50.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/mot_unsm_unsm50.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_mot_unsm_unsm50

saved_tact_sm_sm50: tactile/distinct_sm_sm50.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_sm50.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_sm50

saved_tact_sm_unsm50: tactile/distinct_sm_unsm50.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_sm_unsm50.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_sm_unsm50

saved_tact_unsm_unsm50: tactile/distinct_unsm_unsm50.mat
	matlab -nosplash -nodesktop -r "try, adddistinct('$(subject)','../RESULTS/tact_unsm_unsm50.mat','$<'), catch, 'Error running adddistinct', end; exit" ;\
	touch saved_tact_unsm_unsm50


.PHONY: savec savec50 savec100 savec200 savec300 savec400 savec600 savec1000 savec2000 savec5000 savec10000

savec: savec50 savec100 savec200 savec300 savec400 savec600 savec1000 savec2000 savec5000 savec10000

savec50: savec_aud50 savec_vis50 savec_mot50 savec_tact50
savec100: savec_aud100 savec_vis100 savec_mot100 savec_tact100 savec_aud100_NoOverlap savec_vis100_NoOverlap savec_mot100_NoOverlap savec_tact100_NoOverlap
savec200: savec_aud200 savec_vis200 savec_mot200 savec_tact200 savec_aud200_NoOverlap savec_vis200_NoOverlap savec_mot200_NoOverlap savec_tact200_NoOverlap
savec300: savec_aud300 savec_vis300 savec_mot300 savec_tact300 savec_aud300_NoOverlap savec_vis300_NoOverlap savec_mot300_NoOverlap savec_tact300_NoOverlap
savec400: savec_aud400 savec_vis400 savec_mot400 savec_tact400 savec_aud400_NoOverlap savec_vis400_NoOverlap savec_mot400_NoOverlap savec_tact400_NoOverlap
savec600: savec_aud600 savec_vis600 savec_mot600 savec_tact600 savec_aud600_NoOverlap savec_vis600_NoOverlap savec_mot600_NoOverlap savec_tact600_NoOverlap
savec1000: savec_aud1000 savec_vis1000 savec_mot1000 savec_tact1000 savec_aud1000_NoOverlap savec_vis1000_NoOverlap savec_mot1000_NoOverlap savec_tact1000_NoOverlap
savec2000: savec_aud2000 savec_vis2000 savec_mot2000 savec_tact2000 savec_aud2000_NoOverlap savec_vis2000_NoOverlap savec_mot2000_NoOverlap savec_tact2000_NoOverlap
savec5000: savec_aud5000 savec_vis5000 savec_mot5000 savec_tact5000 savec_aud5000_NoOverlap savec_vis5000_NoOverlap savec_mot5000_NoOverlap savec_tact5000_NoOverlap
savec10000: savec_aud10000 savec_vis10000 savec_mot10000 savec_tact10000 savec_aud10000_NoOverlap savec_vis10000_NoOverlap savec_mot10000_NoOverlap savec_tact10000_NoOverlap

savec_aud50: auditory/classify_auditory50.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_aud50.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_aud50

savec_aud100: auditory/classify_auditory100.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_aud100.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_aud100

savec_aud200: auditory/classify_auditory200.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_aud200.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_aud200

savec_aud300: auditory/classify_auditory300.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_aud300.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_aud300

savec_aud400: auditory/classify_auditory400.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_aud400.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_aud400

savec_aud600: auditory/classify_auditory600.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_aud600.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_aud600

savec_aud1000: auditory/classify_auditory1000.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_aud1000.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_aud1000

savec_aud2000: auditory/classify_auditory2000.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_aud2000.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_aud2000

savec_aud5000: auditory/classify_auditory5000.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_aud5000.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_aud5000

savec_aud10000: auditory/classify_auditory10000.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_aud10000.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_aud10000

savec_aud100_NoOverlap: auditory/classify_auditory100_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_aud100_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_aud100_NoOverlap

savec_aud200_NoOverlap: auditory/classify_auditory200_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_aud200_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_aud200_NoOverlap

savec_aud300_NoOverlap: auditory/classify_auditory300_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_aud300_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_aud300_NoOverlap

savec_aud400_NoOverlap: auditory/classify_auditory400_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_aud400_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_aud400_NoOverlap

savec_aud600_NoOverlap: auditory/classify_auditory600_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_aud600_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_aud600_NoOverlap

savec_aud1000_NoOverlap: auditory/classify_auditory1000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_aud1000_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_aud1000_NoOverlap

savec_aud2000_NoOverlap: auditory/classify_auditory2000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_aud2000_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_aud2000_NoOverlap

savec_aud5000_NoOverlap: auditory/classify_auditory5000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_aud5000_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_aud5000_NoOverlap

savec_aud10000_NoOverlap: auditory/classify_auditory10000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_aud10000_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_aud10000_NoOverlap


savec_vis50: visual/classify_visual50.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_vis50.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_vis50

savec_vis100: visual/classify_visual100.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_vis100.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_vis100

savec_vis200: visual/classify_visual200.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_vis200.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_vis200

savec_vis300: visual/classify_visual300.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_vis300.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_vis300

savec_vis400: visual/classify_visual400.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_vis400.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_vis400

savec_vis600: visual/classify_visual600.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_vis600.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_vis600

savec_vis1000: visual/classify_visual1000.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_vis1000.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_vis1000

savec_vis2000: visual/classify_visual2000.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_vis2000.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_vis2000

savec_vis5000: visual/classify_visual5000.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_vis5000.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_vis5000

savec_vis10000: visual/classify_visual10000.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_vis10000.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_vis10000

savec_vis100_NoOverlap: visual/classify_visual100_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_vis100_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_vis100_NoOverlap

savec_vis200_NoOverlap: visual/classify_visual200_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_vis200_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_vis200_NoOverlap

savec_vis300_NoOverlap: visual/classify_visual300_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_vis300_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_vis300_NoOverlap

savec_vis400_NoOverlap: visual/classify_visual400_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_vis400_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_vis400_NoOverlap

savec_vis600_NoOverlap: visual/classify_visual600_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_vis600_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_vis600_NoOverlap

savec_vis1000_NoOverlap: visual/classify_visual1000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_vis1000_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_vis1000_NoOverlap

savec_vis2000_NoOverlap: visual/classify_visual2000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_vis2000_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_vis2000_NoOverlap

savec_vis5000_NoOverlap: visual/classify_visual5000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_vis5000_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_vis5000_NoOverlap

savec_vis10000_NoOverlap: visual/classify_visual10000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_vis10000_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_vis10000_NoOverlap


savec_mot50: motor/classify_motor50.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_mot50.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_mot50

savec_mot100: motor/classify_motor100.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_mot100.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_mot100

savec_mot200: motor/classify_motor200.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_mot200.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_mot200

savec_mot300: motor/classify_motor300.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_mot300.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_mot300

savec_mot400: motor/classify_motor400.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_mot400.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_mot400

savec_mot600: motor/classify_motor600.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_mot600.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_mot600

savec_mot1000: motor/classify_motor1000.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_mot1000.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_mot1000

savec_mot2000: motor/classify_motor2000.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_mot2000.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_mot2000

savec_mot5000: motor/classify_motor5000.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_mot5000.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_mot5000

savec_mot10000: motor/classify_motor10000.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_mot10000.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_mot10000

savec_mot100_NoOverlap: motor/classify_motor100_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_mot100_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_mot100_NoOverlap

savec_mot200_NoOverlap: motor/classify_motor200_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_mot200_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_mot200_NoOverlap

savec_mot300_NoOverlap: motor/classify_motor300_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_mot300_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_mot300_NoOverlap

savec_mot400_NoOverlap: motor/classify_motor400_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_mot400_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_mot400_NoOverlap

savec_mot600_NoOverlap: motor/classify_motor600_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_mot600_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_mot600_NoOverlap

savec_mot1000_NoOverlap: motor/classify_motor1000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_mot1000_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_mot1000_NoOverlap_NoOverlap

savec_mot2000_NoOverlap: motor/classify_motor2000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_mot2000_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_mot2000_NoOverlap

savec_mot5000_NoOverlap: motor/classify_motor5000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_mot5000_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_mot5000_NoOverlap

savec_mot10000_NoOverlap: motor/classify_motor10000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_mot10000_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_mot10000_NoOverlap



savec_tact50: tactile/classify_tactile50.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_tact50.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_tact50

savec_tact100: tactile/classify_tactile100.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_tact100.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_tact100

savec_tact200: tactile/classify_tactile200.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_tact200.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_tact200

savec_tact300: tactile/classify_tactile300.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_tact300.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_tact300

savec_tact400: tactile/classify_tactile400.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_tact400.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_tact400

savec_tact600: tactile/classify_tactile600.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_tact600.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_tact600

savec_tact1000: tactile/classify_tactile1000.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_tact1000.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_tact1000

savec_tact2000: tactile/classify_tactile2000.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_tact2000.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_tact2000

savec_tact5000: tactile/classify_tactile5000.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_tact5000.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_tact5000

savec_tact10000: tactile/classify_tactile10000.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_tact10000.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_tact10000

savec_tact100_NoOverlap: tactile/classify_tactile100_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_tact100_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_tact100_NoOverlap

savec_tact200_NoOverlap: tactile/classify_tactile200_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_tact200_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_tact200_NoOverlap

savec_tact300_NoOverlap: tactile/classify_tactile300_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_tact300_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_tact300_NoOverlap

savec_tact400_NoOverlap: tactile/classify_tactile400_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_tact400_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_tact400_NoOverlap

savec_tact600_NoOverlap: tactile/classify_tactile600_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_tact600_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_tact600_NoOverlap

savec_tact1000_NoOverlap: tactile/classify_tactile1000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_tact1000_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_tact1000_NoOverlap

savec_tact2000_NoOverlap: tactile/classify_tactile2000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_tact2000_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_tact2000_NoOverlap

savec_tact5000_NoOverlap: tactile/classify_tactile5000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_tact5000_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_tact5000_NoOverlap

savec_tact10000_NoOverlap: tactile/classify_tactile10000_NoOverlap.mat
	matlab -nosplash -nodesktop -r "try, addclassify('$(subject)','../RESULTS/class_tact10000_NoOverlap.mat','$<'), catch, 'Error running addclassify', end; exit" ;\
	touch savec_tact10000_NoOverlap




.PHONY: distinct50 distinct-aud50 distinct-vis50 distinct-mot50 distinct-tact50
.PHONY: distinct-aud_sm_sm50 distinct-aud_sm_unsm50 distinct-aud_unsm_unsm50
.PHONY: distinct-vis_sm_sm50 distinct-vis_sm_unsm50 distinct-vis_unsm_unsm50
.PHONY: distinct-mot_sm_sm50 distinct-mot_sm_unsm50 distinct-mot_unsm_unsm50
.PHONY: distinct-tact_sm_sm50 distinct-tact_sm_unsm50 distinct-tact_unsm_unsm50

distinct50: distinct-aud50 distinct-vis50 distinct-mot50
distinct-aud50: distinct-aud_sm_sm50 distinct-aud_sm_unsm50 distinct-aud_unsm_unsm50
distinct-vis50: distinct-vis_sm_sm50 distinct-vis_sm_unsm50 distinct-vis_unsm_unsm50
distinct-mot50: distinct-mot_sm_sm50 distinct-mot_sm_unsm50 distinct-mot_unsm_unsm50
distinct-tact50: distinct-tact_sm_sm50 distinct-tact_sm_unsm50 distinct-tact_unsm_unsm50

distinct-aud_sm_sm50: auditory/distinct_sm_sm50.mat
distinct-aud_sm_unsm50: auditory/distinct_sm_unsm50.mat
distinct-aud_unsm_unsm50: auditory/distinct_unsm_unsm50.mat

distinct-vis_sm_sm50: visual/distinct_sm_sm50.mat
distinct-vis_sm_unsm50: visual/distinct_sm_unsm50.mat
distinct-vis_unsm_unsm50: visual/distinct_unsm_unsm50.mat

distinct-mot_sm_sm50: motor/distinct_sm_sm50.mat
distinct-mot_sm_unsm50: motor/distinct_sm_unsm50.mat
distinct-mot_unsm_unsm50: motor/distinct_unsm_unsm50.mat

distinct-tact_sm_sm50: tactile/distinct_sm_sm50.mat
distinct-tact_sm_unsm50: tactile/distinct_sm_unsm50.mat
distinct-tact_unsm_unsm50: tactile/distinct_unsm_unsm50.mat

auditory/distinct_sm_sm50.mat: auditory/funcmasked_sm_sm50.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm50.mat','distinct_sm_sm50.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_sm50.mat: visual/funcmasked_sm_sm50.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm50.mat','distinct_sm_sm50.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_sm50.mat: motor/funcmasked_sm_sm50.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm50.mat','distinct_sm_sm50.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_sm50.mat: tactile/funcmasked_sm_sm50.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_sm50.mat','distinct_sm_sm50.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_sm_unsm50.mat: auditory/funcmasked_sm_unsm50.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm50.mat','distinct_sm_unsm50.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_sm_unsm50.mat: visual/funcmasked_sm_unsm50.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm50.mat','distinct_sm_unsm50.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_sm_unsm50.mat: motor/funcmasked_sm_unsm50.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm50.mat','distinct_sm_unsm50.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_sm_unsm50.mat: tactile/funcmasked_sm_unsm50.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_sm_unsm50.mat','distinct_sm_unsm50.mat'), catch, 'Error running corridff', end; exit"

auditory/distinct_unsm_unsm50.mat: auditory/funcmasked_unsm_unsm50.mat
	cd auditory ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm50.mat','distinct_unsm_unsm50.mat'), catch, 'Error running corridff', end; exit"

visual/distinct_unsm_unsm50.mat: visual/funcmasked_unsm_unsm50.mat
	cd visual ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm50.mat','distinct_unsm_unsm50.mat'), catch, 'Error running corridff', end; exit"

motor/distinct_unsm_unsm50.mat: motor/funcmasked_unsm_unsm50.mat
	cd motor ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm50.mat','distinct_unsm_unsm50.mat'), catch, 'Error running corridff', end; exit"

tactile/distinct_unsm_unsm50.mat: tactile/funcmasked_unsm_unsm50.mat
	cd tactile ;\
	matlab -nosplash -nodesktop -r "try, corrdiff('funcmasked_unsm_unsm50.mat','distinct_unsm_unsm50.mat'), catch, 'Error running corridff', end; exit"

.PHONY: allhcorr
allhcorr: allaudhcorr allmothcorr alltacthcorr allvishcorr

.PHONY: allaudhcorr

allaudhcorr: auditory/hcorr_aud50.mat auditory/hcorr_aud100.mat auditory/hcorr_aud200.mat auditory/hcorr_aud300.mat auditory/hcorr_aud400.mat auditory/hcorr_aud600.mat auditory/hcorr_aud1000.mat auditory/hcorr_aud2000.mat auditory/hcorr_aud5000.mat auditory/hcorr_aud10000.mat auditory/hcorr_aud100_NoOverlap.mat auditory/hcorr_aud200_NoOverlap.mat auditory/hcorr_aud300_NoOverlap.mat auditory/hcorr_aud400_NoOverlap.mat auditory/hcorr_aud600_NoOverlap.mat auditory/hcorr_aud1000_NoOverlap.mat auditory/hcorr_aud2000_NoOverlap.mat auditory/hcorr_aud5000_NoOverlap.mat auditory/hcorr_aud10000_NoOverlap.mat


auditory/hcorr_aud50.mat: auditory/funcmasked_sm_sm50.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_aud(50), catch, 'Error running hcorr', end; exit"

auditory/hcorr_aud100.mat: auditory/funcmasked_sm_sm100.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_aud(100), catch, 'Error running hcorr', end; exit"

auditory/hcorr_aud200.mat: auditory/funcmasked_sm_sm200.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_aud(200), catch, 'Error running hcorr', end; exit"

auditory/hcorr_aud300.mat: auditory/funcmasked_sm_sm300.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_aud(300), catch, 'Error running hcorr', end; exit"

auditory/hcorr_aud400.mat: auditory/funcmasked_sm_sm400.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_aud(400), catch, 'Error running hcorr', end; exit"

auditory/hcorr_aud600.mat: auditory/funcmasked_sm_sm600.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_aud(600), catch, 'Error running hcorr', end; exit"

auditory/hcorr_aud1000.mat: auditory/funcmasked_sm_sm1000.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_aud(1000), catch, 'Error running hcorr', end; exit"

auditory/hcorr_aud2000.mat: auditory/funcmasked_sm_sm2000.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_aud(2000), catch, 'Error running hcorr', end; exit"

auditory/hcorr_aud5000.mat: auditory/funcmasked_sm_sm5000.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_aud(5000), catch, 'Error running hcorr', end; exit"

auditory/hcorr_aud10000.mat: auditory/funcmasked_sm_sm10000.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_aud(10000), catch, 'Error running hcorr', end; exit"

auditory/hcorr_aud100_NoOverlap.mat: auditory/funcmasked_sm_sm100_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_aud_NoOverlap(100), catch, 'Error running hcorr', end; exit"

auditory/hcorr_aud200_NoOverlap.mat: auditory/funcmasked_sm_sm200_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_aud_NoOverlap(200), catch, 'Error running hcorr', end; exit"

auditory/hcorr_aud300_NoOverlap.mat: auditory/funcmasked_sm_sm300_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_aud_NoOverlap(300), catch, 'Error running hcorr', end; exit"

auditory/hcorr_aud400_NoOverlap.mat: auditory/funcmasked_sm_sm400_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_aud_NoOverlap(400), catch, 'Error running hcorr', end; exit"

auditory/hcorr_aud600_NoOverlap.mat: auditory/funcmasked_sm_sm600_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_aud_NoOverlap(600), catch, 'Error running hcorr', end; exit"

auditory/hcorr_aud1000_NoOverlap.mat: auditory/funcmasked_sm_sm1000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_aud_NoOverlap(1000), catch, 'Error running hcorr', end; exit"

auditory/hcorr_aud2000_NoOverlap.mat: auditory/funcmasked_sm_sm2000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_aud_NoOverlap(2000), catch, 'Error running hcorr', end; exit"

auditory/hcorr_aud5000_NoOverlap.mat: auditory/funcmasked_sm_sm5000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_aud_NoOverlap(5000), catch, 'Error running hcorr', end; exit"

auditory/hcorr_aud10000_NoOverlap.mat: auditory/funcmasked_sm_sm10000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_aud_NoOverlap(10000), catch, 'Error running hcorr', end; exit"


.PHONY: allmothcorr

allmothcorr: motor/hcorr_mot50.mat motor/hcorr_mot100.mat motor/hcorr_mot200.mat motor/hcorr_mot300.mat motor/hcorr_mot400.mat motor/hcorr_mot600.mat motor/hcorr_mot1000.mat motor/hcorr_mot2000.mat motor/hcorr_mot5000.mat motor/hcorr_mot10000.mat motor/hcorr_mot100_NoOverlap.mat motor/hcorr_mot200_NoOverlap.mat motor/hcorr_mot300_NoOverlap.mat motor/hcorr_mot400_NoOverlap.mat motor/hcorr_mot600_NoOverlap.mat motor/hcorr_mot1000_NoOverlap.mat motor/hcorr_mot2000_NoOverlap.mat motor/hcorr_mot5000_NoOverlap.mat motor/hcorr_mot10000_NoOverlap.mat


motor/hcorr_mot50.mat: motor/funcmasked_sm_sm50.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_mot(50), catch, 'Error running hcorr', end; exit"

motor/hcorr_mot100.mat: motor/funcmasked_sm_sm100.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_mot(100), catch, 'Error running hcorr', end; exit"

motor/hcorr_mot200.mat: motor/funcmasked_sm_sm200.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_mot(200), catch, 'Error running hcorr', end; exit"

motor/hcorr_mot300.mat: motor/funcmasked_sm_sm300.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_mot(300), catch, 'Error running hcorr', end; exit"

motor/hcorr_mot400.mat: motor/funcmasked_sm_sm400.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_mot(400), catch, 'Error running hcorr', end; exit"

motor/hcorr_mot600.mat: motor/funcmasked_sm_sm600.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_mot(600), catch, 'Error running hcorr', end; exit"

motor/hcorr_mot1000.mat: motor/funcmasked_sm_sm1000.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_mot(1000), catch, 'Error running hcorr', end; exit"

motor/hcorr_mot2000.mat: motor/funcmasked_sm_sm2000.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_mot(2000), catch, 'Error running hcorr', end; exit"

motor/hcorr_mot5000.mat: motor/funcmasked_sm_sm5000.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_mot(5000), catch, 'Error running hcorr', end; exit"

motor/hcorr_mot10000.mat: motor/funcmasked_sm_sm10000.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_mot(10000), catch, 'Error running hcorr', end; exit"

motor/hcorr_mot100_NoOverlap.mat: motor/funcmasked_sm_sm100_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_mot_NoOverlap(100), catch, 'Error running hcorr', end; exit"

motor/hcorr_mot200_NoOverlap.mat: motor/funcmasked_sm_sm200_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_mot_NoOverlap(200), catch, 'Error running hcorr', end; exit"

motor/hcorr_mot300_NoOverlap.mat: motor/funcmasked_sm_sm300_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_mot_NoOverlap(300), catch, 'Error running hcorr', end; exit"

motor/hcorr_mot400_NoOverlap.mat: motor/funcmasked_sm_sm400_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_mot_NoOverlap(400), catch, 'Error running hcorr', end; exit"

motor/hcorr_mot600_NoOverlap.mat: motor/funcmasked_sm_sm600_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_mot_NoOverlap(600), catch, 'Error running hcorr', end; exit"

motor/hcorr_mot1000_NoOverlap.mat: motor/funcmasked_sm_sm1000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_mot_NoOverlap(1000), catch, 'Error running hcorr', end; exit"

motor/hcorr_mot2000_NoOverlap.mat: motor/funcmasked_sm_sm2000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_mot_NoOverlap(2000), catch, 'Error running hcorr', end; exit"

motor/hcorr_mot5000_NoOverlap.mat: motor/funcmasked_sm_sm5000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_mot_NoOverlap(5000), catch, 'Error running hcorr', end; exit"

motor/hcorr_mot10000_NoOverlap.mat: motor/funcmasked_sm_sm10000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_mot_NoOverlap(10000), catch, 'Error running hcorr', end; exit"


.PHONY: alltacthcorr

alltacthcorr: tactile/hcorr_tact50.mat tactile/hcorr_tact100.mat tactile/hcorr_tact200.mat tactile/hcorr_tact300.mat tactile/hcorr_tact400.mat tactile/hcorr_tact600.mat tactile/hcorr_tact1000.mat tactile/hcorr_tact2000.mat tactile/hcorr_tact5000.mat tactile/hcorr_tact10000.mat  tactile/hcorr_tact100_NoOverlap.mat tactile/hcorr_tact200_NoOverlap.mat tactile/hcorr_tact300_NoOverlap.mat tactile/hcorr_tact400_NoOverlap.mat tactile/hcorr_tact600_NoOverlap.mat tactile/hcorr_tact1000_NoOverlap.mat tactile/hcorr_tact2000_NoOverlap.mat tactile/hcorr_tact5000_NoOverlap.mat tactile/hcorr_tact10000_NoOverlap.mat


tactile/hcorr_tact50.mat: tactile/funcmasked_sm_sm50.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_tact(50), catch, 'Error running hcorr', end; exit"

tactile/hcorr_tact100.mat: tactile/funcmasked_sm_sm100.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_tact(100), catch, 'Error running hcorr', end; exit"

tactile/hcorr_tact200.mat: tactile/funcmasked_sm_sm200.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_tact(200), catch, 'Error running hcorr', end; exit"

tactile/hcorr_tact300.mat: tactile/funcmasked_sm_sm300.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_tact(300), catch, 'Error running hcorr', end; exit"

tactile/hcorr_tact400.mat: tactile/funcmasked_sm_sm400.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_tact(400), catch, 'Error running hcorr', end; exit"

tactile/hcorr_tact600.mat: tactile/funcmasked_sm_sm600.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_tact(600), catch, 'Error running hcorr', end; exit"

tactile/hcorr_tact1000.mat: tactile/funcmasked_sm_sm1000.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_tact(1000), catch, 'Error running hcorr', end; exit"

tactile/hcorr_tact2000.mat: tactile/funcmasked_sm_sm2000.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_tact(2000), catch, 'Error running hcorr', end; exit"

tactile/hcorr_tact5000.mat: tactile/funcmasked_sm_sm5000.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_tact(5000), catch, 'Error running hcorr', end; exit"

tactile/hcorr_tact10000.mat: tactile/funcmasked_sm_sm10000.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_tact(10000), catch, 'Error running hcorr', end; exit"

tactile/hcorr_tact100_NoOverlap.mat: tactile/funcmasked_sm_sm100_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_tact_NoOverlap(100), catch, 'Error running hcorr', end; exit"

tactile/hcorr_tact200_NoOverlap.mat: tactile/funcmasked_sm_sm200_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_tact_NoOverlap(200), catch, 'Error running hcorr', end; exit"

tactile/hcorr_tact300_NoOverlap.mat: tactile/funcmasked_sm_sm300_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_tact_NoOverlap(300), catch, 'Error running hcorr', end; exit"

tactile/hcorr_tact400_NoOverlap.mat: tactile/funcmasked_sm_sm400_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_tact_NoOverlap(400), catch, 'Error running hcorr', end; exit"

tactile/hcorr_tact600_NoOverlap.mat: tactile/funcmasked_sm_sm600_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_tact_NoOverlap(600), catch, 'Error running hcorr', end; exit"

tactile/hcorr_tact1000_NoOverlap.mat: tactile/funcmasked_sm_sm1000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_tact_NoOverlap(1000), catch, 'Error running hcorr', end; exit"

tactile/hcorr_tact2000_NoOverlap.mat: tactile/funcmasked_sm_sm2000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_tact_NoOverlap(2000), catch, 'Error running hcorr', end; exit"

tactile/hcorr_tact5000_NoOverlap.mat: tactile/funcmasked_sm_sm5000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_tact_NoOverlap(5000), catch, 'Error running hcorr', end; exit"

tactile/hcorr_tact10000_NoOverlap.mat: tactile/funcmasked_sm_sm10000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_tact_NoOverlap(10000), catch, 'Error running hcorr', end; exit"


.PHONY: allvishcorr

allvishcorr: visual/hcorr_vis50.mat visual/hcorr_vis100.mat visual/hcorr_vis200.mat visual/hcorr_vis300.mat visual/hcorr_vis400.mat visual/hcorr_vis600.mat visual/hcorr_vis1000.mat visual/hcorr_vis2000.mat visual/hcorr_vis5000.mat visual/hcorr_vis10000.mat visual/hcorr_vis100_NoOverlap.mat visual/hcorr_vis200_NoOverlap.mat visual/hcorr_vis300_NoOverlap.mat visual/hcorr_vis400_NoOverlap.mat visual/hcorr_vis600_NoOverlap.mat visual/hcorr_vis1000_NoOverlap.mat visual/hcorr_vis2000_NoOverlap.mat visual/hcorr_vis5000_NoOverlap.mat visual/hcorr_vis10000_NoOverlap.mat


visual/hcorr_vis50.mat: visual/funcmasked_sm_sm50.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_vis(50), catch, 'Error running hcorr', end; exit"

visual/hcorr_vis100.mat: visual/funcmasked_sm_sm100.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_vis(100), catch, 'Error running hcorr', end; exit"

visual/hcorr_vis200.mat: visual/funcmasked_sm_sm200.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_vis(200), catch, 'Error running hcorr', end; exit"

visual/hcorr_vis300.mat: visual/funcmasked_sm_sm300.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_vis(300), catch, 'Error running hcorr', end; exit"

visual/hcorr_vis400.mat: visual/funcmasked_sm_sm400.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_vis(400), catch, 'Error running hcorr', end; exit"

visual/hcorr_vis600.mat: visual/funcmasked_sm_sm600.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_vis(600), catch, 'Error running hcorr', end; exit"

visual/hcorr_vis1000.mat: visual/funcmasked_sm_sm1000.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_vis(1000), catch, 'Error running hcorr', end; exit"

visual/hcorr_vis2000.mat: visual/funcmasked_sm_sm2000.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_vis(2000), catch, 'Error running hcorr', end; exit"

visual/hcorr_vis5000.mat: visual/funcmasked_sm_sm5000.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_vis(5000), catch, 'Error running hcorr', end; exit"

visual/hcorr_vis10000.mat: visual/funcmasked_sm_sm10000.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_vis(10000), catch, 'Error running hcorr', end; exit"

visual/hcorr_vis100_NoOverlap.mat: visual/funcmasked_sm_sm100_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_vis_NoOverlap(100), catch, 'Error running hcorr', end; exit"

visual/hcorr_vis200_NoOverlap.mat: visual/funcmasked_sm_sm200_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_vis_NoOverlap(200), catch, 'Error running hcorr', end; exit"

visual/hcorr_vis300_NoOverlap.mat: visual/funcmasked_sm_sm300_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_vis_NoOverlap(300), catch, 'Error running hcorr', end; exit"

visual/hcorr_vis400_NoOverlap.mat: visual/funcmasked_sm_sm400_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_vis_NoOverlap(400), catch, 'Error running hcorr', end; exit"

visual/hcorr_vis600_NoOverlap.mat: visual/funcmasked_sm_sm600_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_vis_NoOverlap(600), catch, 'Error running hcorr', end; exit"

visual/hcorr_vis1000_NoOverlap.mat: visual/funcmasked_sm_sm1000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_vis_NoOverlap(1000), catch, 'Error running hcorr', end; exit"

visual/hcorr_vis2000_NoOverlap.mat: visual/funcmasked_sm_sm2000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_vis_NoOverlap(2000), catch, 'Error running hcorr', end; exit"

visual/hcorr_vis5000_NoOverlap.mat: visual/funcmasked_sm_sm5000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_vis_NoOverlap(5000), catch, 'Error running hcorr', end; exit"

visual/hcorr_vis10000_NoOverlap.mat: visual/funcmasked_sm_sm10000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, hcorr_vis_NoOverlap(10000), catch, 'Error running hcorr', end; exit"


.PHONY:allclassify
allclassify: allaudclassify allmotclassify alltactclassify allvisclassify

.PHONY: allaudclassify 

allaudclassify: auditory/classify_auditory50.mat auditory/classify_auditory100.mat auditory/classify_auditory200.mat auditory/classify_auditory300.mat auditory/classify_auditory400.mat auditory/classify_auditory600.mat auditory/classify_auditory1000.mat auditory/classify_auditory2000.mat auditory/classify_auditory5000.mat  auditory/classify_auditory10000.mat auditory/classify_auditory1400.mat auditory/classify_auditory100_NoOverlap.mat auditory/classify_auditory200_NoOverlap.mat auditory/classify_auditory300_NoOverlap.mat auditory/classify_auditory400_NoOverlap.mat auditory/classify_auditory600_NoOverlap.mat auditory/classify_auditory1000_NoOverlap.mat auditory/classify_auditory2000_NoOverlap.mat auditory/classify_auditory5000_NoOverlap.mat  auditory/classify_auditory10000_NoOverlap.mat 

auditory/classify_auditory50.mat: auditory/funcmasked_sm_sm50.mat 
	matlab -nosplash -nodesktop -r "try, classifier('auditory','50'), catch, 'Error running classifier', end; exit"

auditory/classify_auditory100.mat: auditory/funcmasked_sm_sm100.mat 
	matlab -nosplash -nodesktop -r "try, classifier('auditory','100'), catch, 'Error running classifier', end; exit"

auditory/classify_auditory200.mat: auditory/funcmasked_sm_sm200.mat 
	matlab -nosplash -nodesktop -r "try, classifier('auditory','200'), catch, 'Error running classifier', end; exit"

auditory/classify_auditory300.mat: auditory/funcmasked_sm_sm300.mat 
	matlab -nosplash -nodesktop -r "try, classifier('auditory','300'), catch, 'Error running classifier', end; exit"

auditory/classify_auditory400.mat: auditory/funcmasked_sm_sm400.mat 
	matlab -nosplash -nodesktop -r "try, classifier('auditory','400'), catch, 'Error running classifier', end; exit"

auditory/classify_auditory600.mat: auditory/funcmasked_sm_sm600.mat 
	matlab -nosplash -nodesktop -r "try, classifier('auditory','600'), catch, 'Error running classifier', end; exit"

auditory/classify_auditory1000.mat: auditory/funcmasked_sm_sm1000.mat 
	matlab -nosplash -nodesktop -r "try, classifier('auditory','1000'), catch, 'Error running classifier', end; exit"

auditory/classify_auditory1800.mat: auditory/funcmasked_sm_sm1800.mat 
	matlab -nosplash -nodesktop -r "try, classifier('auditory','1800'), catch, 'Error running classifier', end; exit"

auditory/classify_auditory2000.mat: auditory/funcmasked_sm_sm2000.mat 
	matlab -nosplash -nodesktop -r "try, classifier('auditory','2000'), catch, 'Error running classifier', end; exit"

auditory/classify_auditory5000.mat: auditory/funcmasked_sm_sm5000.mat 
	matlab -nosplash -nodesktop -r "try, classifier('auditory','5000'), catch, 'Error running classifier', end; exit"

auditory/classify_auditory10000.mat: auditory/funcmasked_sm_sm10000.mat 
	matlab -nosplash -nodesktop -r "try, classifier('auditory','10000'), catch, 'Error running classifier', end; exit"

auditory/classify_auditory100_NoOverlap.mat: auditory/funcmasked_sm_sm100_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('auditory','100'), catch, 'Error running classifier', end; exit"

auditory/classify_auditory200_NoOverlap.mat: auditory/funcmasked_sm_sm200_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('auditory','200'), catch, 'Error running classifier', end; exit"

auditory/classify_auditory300_NoOverlap.mat: auditory/funcmasked_sm_sm300_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('auditory','300'), catch, 'Error running classifier', end; exit"

auditory/classify_auditory400_NoOverlap.mat: auditory/funcmasked_sm_sm400_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('auditory','400'), catch, 'Error running classifier', end; exit"

auditory/classify_auditory600_NoOverlap.mat: auditory/funcmasked_sm_sm600_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('auditory','600'), catch, 'Error running classifier', end; exit"

auditory/classify_auditory1000_NoOverlap.mat: auditory/funcmasked_sm_sm1000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('auditory','1000'), catch, 'Error running classifier', end; exit"

auditory/classify_auditory2000_NoOverlap.mat: auditory/funcmasked_sm_sm2000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('auditory','2000'), catch, 'Error running classifier', end; exit"

auditory/classify_auditory5000_NoOverlap.mat: auditory/funcmasked_sm_sm5000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('auditory','5000'), catch, 'Error running classifier', end; exit"

auditory/classify_auditory10000_NoOverlap.mat: auditory/funcmasked_sm_sm10000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('auditory','10000'), catch, 'Error running classifier', end; exit"

.PHONY: allmotclassify 

allmotclassify: motor/classify_motor50.mat motor/classify_motor100.mat motor/classify_motor200.mat motor/classify_motor300.mat motor/classify_motor400.mat motor/classify_motor600.mat motor/classify_motor1000.mat motor/classify_motor2000.mat motor/classify_motor5000.mat  motor/classify_motor10000.mat motor/classify_motor100_NoOverlap.mat motor/classify_motor200_NoOverlap.mat motor/classify_motor300_NoOverlap.mat motor/classify_motor400_NoOverlap.mat motor/classify_motor600_NoOverlap.mat motor/classify_motor1000_NoOverlap.mat motor/classify_motor2000_NoOverlap.mat motor/classify_motor5000_NoOverlap.mat  motor/classify_motor10000_NoOverlap.mat


motor/classify_motor50.mat: motor/funcmasked_sm_sm50.mat 
	matlab -nosplash -nodesktop -r "try, classifier('motor','50'), catch, 'Error running classifier', end; exit"

motor/classify_motor100.mat: motor/funcmasked_sm_sm100.mat 
	matlab -nosplash -nodesktop -r "try, classifier('motor','100'), catch, 'Error running classifier', end; exit"

motor/classify_motor200.mat: motor/funcmasked_sm_sm200.mat 
	matlab -nosplash -nodesktop -r "try, classifier('motor','200'), catch, 'Error running classifier', end; exit"

motor/classify_motor300.mat: motor/funcmasked_sm_sm300.mat 
	matlab -nosplash -nodesktop -r "try, classifier('motor','300'), catch, 'Error running classifier', end; exit"

motor/classify_motor400.mat: motor/funcmasked_sm_sm400.mat 
	matlab -nosplash -nodesktop -r "try, classifier('motor','400'), catch, 'Error running classifier', end; exit"

motor/classify_motor600.mat: motor/funcmasked_sm_sm600.mat 
	matlab -nosplash -nodesktop -r "try, classifier('motor','600'), catch, 'Error running classifier', end; exit"

motor/classify_motor1000.mat: motor/funcmasked_sm_sm1000.mat 
	matlab -nosplash -nodesktop -r "try, classifier('motor','1000'), catch, 'Error running classifier', end; exit"

motor/classify_motor2000.mat: motor/funcmasked_sm_sm2000.mat 
	matlab -nosplash -nodesktop -r "try, classifier('motor','2000'), catch, 'Error running classifier', end; exit"

motor/classify_motor5000.mat: motor/funcmasked_sm_sm5000.mat 
	matlab -nosplash -nodesktop -r "try, classifier('motor','5000'), catch, 'Error running classifier', end; exit"

motor/classify_motor10000.mat: motor/funcmasked_sm_sm10000.mat 
	matlab -nosplash -nodesktop -r "try, classifier('motor','10000'), catch, 'Error running classifier', end; exit"

motor/classify_motor100_NoOverlap.mat: motor/funcmasked_sm_sm100_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('motor','100'), catch, 'Error running classifier', end; exit"

motor/classify_motor200_NoOverlap.mat: motor/funcmasked_sm_sm200_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('motor','200'), catch, 'Error running classifier', end; exit"

motor/classify_motor300_NoOverlap.mat: motor/funcmasked_sm_sm300_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('motor','300'), catch, 'Error running classifier', end; exit"

motor/classify_motor400_NoOverlap.mat: motor/funcmasked_sm_sm400_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('motor','400'), catch, 'Error running classifier', end; exit"

motor/classify_motor600_NoOverlap.mat: motor/funcmasked_sm_sm600_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('motor','600'), catch, 'Error running classifier', end; exit"

motor/classify_motor1000_NoOverlap.mat: motor/funcmasked_sm_sm1000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('motor','1000'), catch, 'Error running classifier', end; exit"

motor/classify_motor2000_NoOverlap.mat: motor/funcmasked_sm_sm2000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('motor','2000'), catch, 'Error running classifier', end; exit"

motor/classify_motor5000_NoOverlap.mat: motor/funcmasked_sm_sm5000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('motor','5000'), catch, 'Error running classifier', end; exit"

motor/classify_motor10000_NoOverlap.mat: motor/funcmasked_sm_sm10000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('motor','10000'), catch, 'Error running classifier', end; exit"


.PHONY: allvisclassify 
allvisclassify: visual/classify_visual50.mat visual/classify_visual100.mat visual/classify_visual200.mat visual/classify_visual300.mat visual/classify_visual400.mat visual/classify_visual600.mat visual/classify_visual1000.mat visual/classify_visual2000.mat visual/classify_visual5000.mat  visual/classify_visual10000.mat visual/classify_visual100_NoOverlap.mat visual/classify_visual200_NoOverlap.mat visual/classify_visual300_NoOverlap.mat visual/classify_visual400_NoOverlap.mat visual/classify_visual600_NoOverlap.mat visual/classify_visual1000_NoOverlap.mat visual/classify_visual2000_NoOverlap.mat visual/classify_visual5000_NoOverlap.mat  visual/classify_visual10000_NoOverlap.mat


visual/classify_visual50.mat: visual/funcmasked_sm_sm50.mat 
	matlab -nosplash -nodesktop -r "try, classifier('visual','50'), catch, 'Error running classifier', end; exit"

visual/classify_visual100.mat: visual/funcmasked_sm_sm100.mat 
	matlab -nosplash -nodesktop -r "try, classifier('visual','100'), catch, 'Error running classifier', end; exit"

visual/classify_visual200.mat: visual/funcmasked_sm_sm200.mat 
	matlab -nosplash -nodesktop -r "try, classifier('visual','200'), catch, 'Error running classifier', end; exit"

visual/classify_visual300.mat: visual/funcmasked_sm_sm300.mat 
	matlab -nosplash -nodesktop -r "try, classifier('visual','300'), catch, 'Error running classifier', end; exit"

visual/classify_visual400.mat: visual/funcmasked_sm_sm400.mat 
	matlab -nosplash -nodesktop -r "try, classifier('visual','400'), catch, 'Error running classifier', end; exit"

visual/classify_visual600.mat: visual/funcmasked_sm_sm600.mat 
	matlab -nosplash -nodesktop -r "try, classifier('visual','600'), catch, 'Error running classifier', end; exit"

visual/classify_visual1000.mat: visual/funcmasked_sm_sm1000.mat 
	matlab -nosplash -nodesktop -r "try, classifier('visual','1000'), catch, 'Error running classifier', end; exit"

visual/classify_visual2000.mat: visual/funcmasked_sm_sm2000.mat 
	matlab -nosplash -nodesktop -r "try, classifier('visual','2000'), catch, 'Error running classifier', end; exit"

visual/classify_visual5000.mat: visual/funcmasked_sm_sm5000.mat 
	matlab -nosplash -nodesktop -r "try, classifier('visual','5000'), catch, 'Error running classifier', end; exit"

visual/classify_visual10000.mat: visual/funcmasked_sm_sm10000.mat 
	matlab -nosplash -nodesktop -r "try, classifier('visual','10000'), catch, 'Error running classifier', end; exit"

visual/classify_visual100_NoOverlap.mat: visual/funcmasked_sm_sm100_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('visual','100'), catch, 'Error running classifier', end; exit"

visual/classify_visual200_NoOverlap.mat: visual/funcmasked_sm_sm200_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('visual','200'), catch, 'Error running classifier', end; exit"

visual/classify_visual300_NoOverlap.mat: visual/funcmasked_sm_sm300_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('visual','300'), catch, 'Error running classifier', end; exit"

visual/classify_visual400_NoOverlap.mat: visual/funcmasked_sm_sm400_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('visual','400'), catch, 'Error running classifier', end; exit"

visual/classify_visual600_NoOverlap.mat: visual/funcmasked_sm_sm600_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('visual','600'), catch, 'Error running classifier', end; exit"

visual/classify_visual1000_NoOverlap.mat: visual/funcmasked_sm_sm1000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('visual','1000'), catch, 'Error running classifier', end; exit"

visual/classify_visual2000_NoOverlap.mat: visual/funcmasked_sm_sm2000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('visual','2000'), catch, 'Error running classifier', end; exit"

visual/classify_visual5000_NoOverlap.mat: visual/funcmasked_sm_sm5000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('visual','5000'), catch, 'Error running classifier', end; exit"

visual/classify_visual10000_NoOverlap.mat: visual/funcmasked_sm_sm10000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('visual','10000'), catch, 'Error running classifier', end; exit"

.PHONY: alltactclassify
  
alltactclassify: tactile/classify_tactile50.mat tactile/classify_tactile100.mat tactile/classify_tactile200.mat tactile/classify_tactile300.mat tactile/classify_tactile400.mat tactile/classify_tactile600.mat tactile/classify_tactile1000.mat tactile/classify_tactile2000.mat tactile/classify_tactile5000.mat  tactile/classify_tactile10000.mat tactile/classify_tactile100_NoOverlap.mat tactile/classify_tactile200_NoOverlap.mat tactile/classify_tactile300_NoOverlap.mat tactile/classify_tactile400_NoOverlap.mat tactile/classify_tactile600_NoOverlap.mat tactile/classify_tactile1000_NoOverlap.mat tactile/classify_tactile2000_NoOverlap.mat tactile/classify_tactile5000_NoOverlap.mat  tactile/classify_tactile10000_NoOverlap.mat


tactile/classify_tactile50.mat: tactile/funcmasked_sm_sm50.mat 
	matlab -nosplash -nodesktop -r "try, classifier('tactile','50'), catch, 'Error running classifier', end; exit"

tactile/classify_tactile100.mat: tactile/funcmasked_sm_sm100.mat 
	matlab -nosplash -nodesktop -r "try, classifier('tactile','100'), catch, 'Error running classifier', end; exit"

tactile/classify_tactile200.mat: tactile/funcmasked_sm_sm200.mat 
	matlab -nosplash -nodesktop -r "try, classifier('tactile','200'), catch, 'Error running classifier', end; exit"

tactile/classify_tactile300.mat: tactile/funcmasked_sm_sm300.mat 
	matlab -nosplash -nodesktop -r "try, classifier('tactile','300'), catch, 'Error running classifier', end; exit"

tactile/classify_tactile400.mat: tactile/funcmasked_sm_sm400.mat 
	matlab -nosplash -nodesktop -r "try, classifier('tactile','400'), catch, 'Error running classifier', end; exit"

tactile/classify_tactile600.mat: tactile/funcmasked_sm_sm600.mat 
	matlab -nosplash -nodesktop -r "try, classifier('tactile','600'), catch, 'Error running classifier', end; exit"

tactile/classify_tactile1000.mat: tactile/funcmasked_sm_sm1000.mat 
	matlab -nosplash -nodesktop -r "try, classifier('tactile','1000'), catch, 'Error running classifier', end; exit"

tactile/classify_tactile2000.mat: tactile/funcmasked_sm_sm2000.mat 
	matlab -nosplash -nodesktop -r "try, classifier('tactile','2000'), catch, 'Error running classifier', end; exit"

tactile/classify_tactile5000.mat: tactile/funcmasked_sm_sm5000.mat 
	matlab -nosplash -nodesktop -r "try, classifier('tactile','5000'), catch, 'Error running classifier', end; exit"

tactile/classify_tactile10000.mat: tactile/funcmasked_sm_sm10000.mat 
	matlab -nosplash -nodesktop -r "try, classifier('tactile','10000'), catch, 'Error running classifier', end; exit"

tactile/classify_tactile100_NoOverlap.mat: tactile/funcmasked_sm_sm100_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('tactile','100'), catch, 'Error running classifier', end; exit"

tactile/classify_tactile200_NoOverlap.mat: tactile/funcmasked_sm_sm200_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('tactile','200'), catch, 'Error running classifier', end; exit"

tactile/classify_tactile300_NoOverlap.mat: tactile/funcmasked_sm_sm300_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('tactile','300'), catch, 'Error running classifier', end; exit"

tactile/classify_tactile400_NoOverlap.mat: tactile/funcmasked_sm_sm400_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('tactile','400'), catch, 'Error running classifier', end; exit"

tactile/classify_tactile600_NoOverlap.mat: tactile/funcmasked_sm_sm600_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('tactile','600'), catch, 'Error running classifier', end; exit"

tactile/classify_tactile1000_NoOverlap.mat: tactile/funcmasked_sm_sm1000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifierNoOverlap('tactile','1000'), catch, 'Error running classifier', end; exit"

tactile/classify_tactile2000_NoOverlap.mat: tactile/funcmasked_sm_sm2000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('tactile','2000'), catch, 'Error running classifier', end; exit"

tactile/classify_tactile5000_NoOverlap.mat: tactile/funcmasked_sm_sm5000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('tactile','5000'), catch, 'Error running classifier', end; exit"

tactile/classify_tactile10000_NoOverlap.mat: tactile/funcmasked_sm_sm10000_NoOverlap.mat 
	matlab -nosplash -nodesktop -r "try, classifier_NoOverlap('tactile','10000'), catch, 'Error running classifier', end; exit"



auditory/funcmasked_sm_sm50.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemSm12conds.mat auditory/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(50,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_sm_unsm50.mat: auditory/LeftHemSm2conds.mat auditory/RightHemSm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(50,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/funcmasked_unsm_unsm50.mat: auditory/LeftHemUnsm2conds.mat auditory/RightHemUnsm2conds.mat auditory/LeftHemUnsm12conds.mat auditory/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(50,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_sm50.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemSm12conds.mat motor/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(50,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_sm_unsm50.mat: motor/LeftHemSm2conds.mat motor/RightHemSm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(50,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/funcmasked_unsm_unsm50.mat: motor/LeftHemUnsm2conds.mat motor/RightHemUnsm2conds.mat motor/LeftHemUnsm12conds.mat motor/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(50,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_sm50.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemSm12conds.mat visual/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(50,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_sm_unsm50.mat: visual/LeftHemSm2conds.mat visual/RightHemSm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(50,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/funcmasked_unsm_unsm50.mat: visual/LeftHemUnsm2conds.mat visual/RightHemUnsm2conds.mat visual/LeftHemUnsm12conds.mat visual/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(50,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_sm50.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemSm12conds.mat tactile/RightHemSm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(50,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_sm_unsm50.mat: tactile/LeftHemSm2conds.mat tactile/RightHemSm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(50,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/funcmasked_unsm_unsm50.mat: tactile/LeftHemUnsm2conds.mat tactile/RightHemUnsm2conds.mat tactile/LeftHemUnsm12conds.mat tactile/RightHemUnsm12conds.mat
	matlab -nosplash -nodesktop -r "try, applyfuncmask(50,'$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"



auditory/LeftHemSm2conds.mat: auditory/musicspeech.sm5.lh/beta.nii.gz ../newauditoryverticeslh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/RightHemSm2conds.mat: auditory/musicspeech.sm5.rh/beta.nii.gz ../newauditoryverticesrh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/LeftHemSm12conds.mat: auditory/musicspeech.sm5.12blks.lh/beta.nii.gz ../newauditoryverticeslh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/RightHemSm12conds.mat: auditory/musicspeech.sm5.12blks.rh/beta.nii.gz ../newauditoryverticesrh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/LeftHemUnsm2conds.mat: auditory/musicspeech.sm0.lh/beta.nii.gz ../newauditoryverticeslh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/RightHemUnsm2conds.mat: auditory/musicspeech.sm0.rh/beta.nii.gz ../newauditoryverticesrh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/LeftHemUnsm12conds.mat: auditory/musicspeech.sm0.12blks.lh/beta.nii.gz ../newauditoryverticeslh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

auditory/RightHemUnsm12conds.mat: auditory/musicspeech.sm0.12blks.rh/beta.nii.gz ../newauditoryverticesrh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/LeftHemSm2conds.mat: motor/rightleftm.sm5.lh/beta.nii.gz ../motorverticeslh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/RightHemSm2conds.mat: motor/rightleftm.sm5.rh/beta.nii.gz ../motorverticesrh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/LeftHemSm12conds.mat: motor/rightleftm.sm5.12blks.lh/beta.nii.gz ../motorverticeslh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/RightHemSm12conds.mat: motor/rightleftm.sm5.12blks.rh/beta.nii.gz ../motorverticesrh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/LeftHemUnsm2conds.mat: motor/rightleftm.sm0.lh/beta.nii.gz ../motorverticeslh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/RightHemUnsm2conds.mat: motor/rightleftm.sm0.rh/beta.nii.gz ../motorverticesrh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/LeftHemUnsm12conds.mat: motor/rightleftm.sm0.12blks.lh/beta.nii.gz ../motorverticeslh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

motor/RightHemUnsm12conds.mat: motor/rightleftm.sm0.12blks.rh/beta.nii.gz ../motorverticesrh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"


visual/LeftHemSm2conds.mat: visual/houseface.sm5.lh/beta.nii.gz ../visualverticeslh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/RightHemSm2conds.mat: visual/houseface.sm5.rh/beta.nii.gz ../visualverticesrh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/LeftHemSm12conds.mat: visual/houseface.sm5.12blks.lh/beta.nii.gz ../visualverticeslh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/RightHemSm12conds.mat: visual/houseface.sm5.12blks.rh/beta.nii.gz ../visualverticesrh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/LeftHemUnsm2conds.mat: visual/houseface.sm0.lh/beta.nii.gz ../visualverticeslh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/RightHemUnsm2conds.mat: visual/houseface.sm0.rh/beta.nii.gz ../visualverticesrh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/LeftHemUnsm12conds.mat: visual/houseface.sm0.12blks.lh/beta.nii.gz ../visualverticeslh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

visual/RightHemUnsm12conds.mat: visual/houseface.sm0.12blks.rh/beta.nii.gz ../visualverticesrh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"


tactile/LeftHemSm2conds.mat: tactile/rightleftt.sm5.lh/beta.nii.gz ../tactileverticeslh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/RightHemSm2conds.mat: tactile/rightleftt.sm5.rh/beta.nii.gz ../tactileverticesrh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/LeftHemSm12conds.mat: tactile/rightleftt.sm5.12blks.lh/beta.nii.gz ../tactileverticeslh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/RightHemSm12conds.mat: tactile/rightleftt.sm5.12blks.rh/beta.nii.gz ../tactileverticesrh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/LeftHemUnsm2conds.mat: tactile/rightleftt.sm0.lh/beta.nii.gz ../tactileverticeslh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/RightHemUnsm2conds.mat: tactile/rightleftt.sm0.rh/beta.nii.gz ../tactileverticesrh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/LeftHemUnsm12conds.mat: tactile/rightleftt.sm0.12blks.lh/beta.nii.gz ../tactileverticeslh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"

tactile/RightHemUnsm12conds.mat: tactile/rightleftt.sm0.12blks.rh/beta.nii.gz ../tactileverticesrh.mat
	matlab -nosplash -nodesktop -r "try, applystrucmask('$(word 1,$^)', '$(word 2,$^)', '$@'), catch, 'Error running applystrucmask', end; exit"


.PHONY: fit fitauditory fitvisual fitmotor fittactile
.PHONY: fitauditorysm fitvisualsm fitmotorsm fittactilesm fitauditoryunsm fitvisualunsm fitmotorunsm fittactileunsm

fit: fitauditory fitvisual fitmotor
fitauditory: fitauditorysm fitauditoryunsm
fitvisual: fitvisualsm fitvisualunsm
fitmotor: fitmotorsm fitmotorunsm
fittactile: fittactilesm fittactileunsm

fitauditoryunsm: auditory/musicspeech.sm0.12blks.lh/beta.nii.gz auditory/musicspeech.sm0.12blks.rh/beta.nii.gz auditory/musicspeech.sm0.lh/beta.nii.gz auditory/musicspeech.sm0.rh/beta.nii.gz

auditory/musicspeech.sm0.12blks.lh/beta.nii.gz: ../musicspeech.sm0.12blks.lh/music-vs-fix.mat ../musicspeech.sm0.12blks.lh/speech-vs-fix.mat convertunsm-auditory auditory/001/Music.Speech.12blks.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis musicspeech.sm0.12blks.lh

../musicspeech.sm0.12blks.lh/speech-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis musicspeech.sm0.12blks.lh -contrast speech-vs-fix -a 7 -a 8 -a 9 -a 10 -a 11 -a 12 -c 0

../musicspeech.sm0.12blks.lh/music-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis musicspeech.sm0.12blks.lh -contrast music-vs-fix -a 1 -a 2 -a 3 -a 4 -a 5 -a 6 -c 0

auditory/musicspeech.sm0.12blks.rh/beta.nii.gz: ../musicspeech.sm0.12blks.rh/music-vs-fix.mat ../musicspeech.sm0.12blks.rh/speech-vs-fix.mat convertunsm-auditory auditory/001/Music.Speech.12blks.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis musicspeech.sm0.12blks.rh

../musicspeech.sm0.12blks.rh/speech-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis musicspeech.sm0.12blks.rh -contrast speech-vs-fix -a 7 -a 8 -a 9 -a 10 -a 11 -a 12 -c 0

../musicspeech.sm0.12blks.rh/music-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis musicspeech.sm0.12blks.rh -contrast music-vs-fix -a 1 -a 2 -a 3 -a 4 -a 5 -a 6 -c 0

auditory/musicspeech.sm0.lh/beta.nii.gz: ../musicspeech.sm0.lh/fix-vs-musicspeech.mat ../musicspeech.sm0.lh/speech-vs-fix.mat convertunsm-auditory auditory/001/Music.Speech.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis musicspeech.sm0.lh

../musicspeech.sm0.lh/speech-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis musicspeech.sm0.lh -contrast speech-vs-fix -a 2 -c 0

../musicspeech.sm0.lh/music-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis musicspeech.sm0.lh -contrast music-vs-fix -a 1 -c 0

../musicspeech.sm0.lh/fix-vs-musicspeech.mat:
	cd .. ;\
	mkcontrast-sess -analysis musicspeech.sm0.lh -contrast fix-vs-musicspeech -a 0 -c 1 -c 2

auditory/musicspeech.sm0.rh/beta.nii.gz: ../musicspeech.sm0.rh/fix-vs-musicspeech.mat ../musicspeech.sm0.rh/speech-vs-fix.mat convertunsm-auditory auditory/001/Music.Speech.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis musicspeech.sm0.rh

../musicspeech.sm0.rh/speech-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis musicspeech.sm0.rh -contrast speech-vs-fix -a 2 -c 0

../musicspeech.sm0.rh/music-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis musicspeech.sm0.rh -contrast music-vs-fix -a 1 -c 0

../musicspeech.sm0.rh/fix-vs-musicspeech.mat:
	cd .. ;\
	mkcontrast-sess -analysis musicspeech.sm0.rh -contrast fix-vs-musicspeech -a 0 -c 1 -c 2

fitvisualunsm: visual/houseface.sm0.12blks.lh/beta.nii.gz visual/houseface.sm0.12blks.rh/beta.nii.gz visual/houseface.sm0.lh/beta.nii.gz visual/houseface.sm0.rh/beta.nii.gz

visual/houseface.sm0.12blks.lh/beta.nii.gz: ../houseface.sm0.12blks.lh/house-vs-fix.mat ../houseface.sm0.12blks.lh/face-vs-fix.mat convertunsm-visual visual/001/House.Face.12blks.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis houseface.sm0.12blks.lh

../houseface.sm0.12blks.lh/face-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis houseface.sm0.12blks.lh -contrast face-vs-fix -a 7 -a 8 -a 9 -a 10 -a 11 -a 12 -c 0

../houseface.sm0.12blks.lh/house-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis houseface.sm0.12blks.lh -contrast house-vs-fix -a 1 -a 2 -a 3 -a 4 -a 5 -a 6 -c 0

visual/houseface.sm0.12blks.rh/beta.nii.gz: ../houseface.sm0.12blks.rh/house-vs-fix.mat ../houseface.sm0.12blks.rh/face-vs-fix.mat convertunsm-visual visual/001/House.Face.12blks.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis houseface.sm0.12blks.rh

../houseface.sm0.12blks.rh/face-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis houseface.sm0.12blks.rh -contrast face-vs-fix -a 7 -a 8 -a 9 -a 10 -a 11 -a 12 -c 0

../houseface.sm0.12blks.rh/house-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis houseface.sm0.12blks.rh -contrast house-vs-fix -a 1 -a 2 -a 3 -a 4 -a 5 -a 6 -c 0

visual/houseface.sm0.lh/beta.nii.gz: ../houseface.sm0.lh/house-vs-fix.mat ../houseface.sm0.lh/face-vs-fix.mat convertunsm-visual visual/001/House.Face.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis houseface.sm0.lh

../houseface.sm0.lh/face-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis houseface.sm0.lh -contrast face-vs-fix -a 2 -c 0

../houseface.sm0.lh/house-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis houseface.sm0.lh -contrast house-vs-fix -a 1 -c 0

visual/houseface.sm0.rh/beta.nii.gz: ../houseface.sm0.rh/house-vs-fix.mat ../houseface.sm0.rh/face-vs-fix.mat convertunsm-visual visual/001/House.Face.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis houseface.sm0.rh

../houseface.sm0.rh/face-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis houseface.sm0.rh -contrast face-vs-fix -a 2 -c 0

../houseface.sm0.rh/house-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis houseface.sm0.rh -contrast house-vs-fix -a 1 -c 0

fitmotorunsm: motor/rightleftm.sm0.12blks.lh/beta.nii.gz motor/rightleftm.sm0.12blks.rh/beta.nii.gz motor/rightleftm.sm0.lh/beta.nii.gz motor/rightleftm.sm0.rh/beta.nii.gz

motor/rightleftm.sm0.12blks.lh/beta.nii.gz: ../rightleftm.sm0.12blks.lh/right-vs-fix.mat ../rightleftm.sm0.12blks.lh/left-vs-fix.mat convertunsm-motor motor/001/Right.Left.12blks.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis rightleftm.sm0.12blks.lh

../rightleftm.sm0.12blks.lh/left-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftm.sm0.12blks.lh -contrast left-vs-fix -a 7 -a 8 -a 9 -a 10 -a 11 -a 12 -c 0

../rightleftm.sm0.12blks.lh/right-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftm.sm0.12blks.lh -contrast right-vs-fix -a 1 -a 2 -a 3 -a 4 -a 5 -a 6 -c 0

motor/rightleftm.sm0.12blks.rh/beta.nii.gz: ../rightleftm.sm0.12blks.rh/right-vs-fix.mat ../rightleftm.sm0.12blks.rh/left-vs-fix.mat convertunsm-motor motor/001/Right.Left.12blks.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis rightleftm.sm0.12blks.rh

../rightleftm.sm0.12blks.rh/left-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftm.sm0.12blks.rh -contrast left-vs-fix -a 7 -a 8 -a 9 -a 10 -a 11 -a 12 -c 0

../rightleftm.sm0.12blks.rh/right-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftm.sm0.12blks.rh -contrast right-vs-fix -a 1 -a 2 -a 3 -a 4 -a 5 -a 6 -c 0

motor/rightleftm.sm0.lh/beta.nii.gz: ../rightleftm.sm0.lh/right-vs-fix.mat ../rightleftm.sm0.lh/left-vs-fix.mat convertunsm-motor motor/001/Right.Left.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis rightleftm.sm0.lh

../rightleftm.sm0.lh/left-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftm.sm0.lh -contrast left-vs-fix -a 2 -c 0

../rightleftm.sm0.lh/right-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftm.sm0.lh -contrast right-vs-fix -a 1 -c 0

motor/rightleftm.sm0.rh/beta.nii.gz: ../rightleftm.sm0.rh/right-vs-fix.mat ../rightleftm.sm0.rh/left-vs-fix.mat convertunsm-motor motor/001/Right.Left.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis rightleftm.sm0.rh

../rightleftm.sm0.rh/left-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftm.sm0.rh -contrast left-vs-fix -a 2 -c 0

../rightleftm.sm0.rh/right-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftm.sm0.rh -contrast right-vs-fix -a 1 -c 0

fittactileunsm: tactile/rightleftt.sm0.12blks.lh/beta.nii.gz tactile/rightleftt.sm0.12blks.rh/beta.nii.gz tactile/rightleftt.sm0.lh/beta.nii.gz tactile/rightleftt.sm0.rh/beta.nii.gz

tactile/rightleftt.sm0.12blks.lh/beta.nii.gz: ../rightleftt.sm0.12blks.lh/right-vs-fix.mat ../rightleftt.sm0.12blks.lh/left-vs-fix.mat convertunsm-tactile tactile/001/Right.Left.12blks.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis rightleftt.sm0.12blks.lh

../rightleftt.sm0.12blks.lh/left-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftt.sm0.12blks.lh -contrast left-vs-fix -a 7 -a 8 -a 9 -a 10 -a 11 -a 12 -c 0

../rightleftt.sm0.12blks.lh/right-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftt.sm0.12blks.lh -contrast right-vs-fix -a 1 -a 2 -a 3 -a 4 -a 5 -a 6 -c 0

tactile/rightleftt.sm0.12blks.rh/beta.nii.gz: ../rightleftt.sm0.12blks.rh/right-vs-fix.mat ../rightleftt.sm0.12blks.rh/left-vs-fix.mat convertunsm-tactile tactile/001/Right.Left.12blks.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis rightleftt.sm0.12blks.rh

../rightleftt.sm0.12blks.rh/left-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftt.sm0.12blks.rh -contrast left-vs-fix -a 7 -a 8 -a 9 -a 10 -a 11 -a 12 -c 0

../rightleftt.sm0.12blks.rh/right-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftt.sm0.12blks.rh -contrast right-vs-fix -a 1 -a 2 -a 3 -a 4 -a 5 -a 6 -c 0

tactile/rightleftt.sm0.lh/beta.nii.gz: ../rightleftt.sm0.lh/right-vs-fix.mat ../rightleftt.sm0.lh/left-vs-fix.mat convertunsm-tactile tactile/001/Right.Left.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis rightleftt.sm0.lh

../rightleftt.sm0.lh/left-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftt.sm0.lh -contrast left-vs-fix -a 2 -c 0

../rightleftt.sm0.lh/right-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftt.sm0.lh -contrast right-vs-fix -a 1 -c 0

tactile/rightleftt.sm0.rh/beta.nii.gz: ../rightleftt.sm0.rh/right-vs-fix.mat ../rightleftt.sm0.rh/left-vs-fix.mat convertunsm-tactile tactile/001/Right.Left.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis rightleftt.sm0.rh

../rightleftt.sm0.rh/left-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftt.sm0.rh -contrast left-vs-fix -a 2 -c 0

../rightleftt.sm0.rh/right-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftt.sm0.rh -contrast right-vs-fix -a 1 -c 0


fitauditorysm: auditory/musicspeech.sm5.12blks.lh/beta.nii.gz auditory/musicspeech.sm5.12blks.rh/beta.nii.gz auditory/musicspeech.sm5.lh/beta.nii.gz auditory/musicspeech.sm5.rh/beta.nii.gz

auditory/musicspeech.sm5.12blks.lh/beta.nii.gz: ../musicspeech.sm5.12blks.lh/music-vs-fix.mat ../musicspeech.sm5.12blks.lh/speech-vs-fix.mat convertsm-auditory auditory/001/Music.Speech.12blks.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis musicspeech.sm5.12blks.lh

../musicspeech.sm5.12blks.lh/speech-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis musicspeech.sm5.12blks.lh -contrast speech-vs-fix -a 7 -a 8 -a 9 -a 10 -a 11 -a 12 -c 0

../musicspeech.sm5.12blks.lh/music-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis musicspeech.sm5.12blks.lh -contrast music-vs-fix -a 1 -a 2 -a 3 -a 4 -a 5 -a 6 -c 0

auditory/musicspeech.sm5.12blks.rh/beta.nii.gz: ../musicspeech.sm5.12blks.rh/music-vs-fix.mat ../musicspeech.sm5.12blks.rh/speech-vs-fix.mat convertsm-auditory auditory/001/Music.Speech.12blks.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis musicspeech.sm5.12blks.rh

../musicspeech.sm5.12blks.rh/speech-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis musicspeech.sm5.12blks.rh -contrast speech-vs-fix -a 7 -a 8 -a 9 -a 10 -a 11 -a 12 -c 0

../musicspeech.sm5.12blks.rh/music-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis musicspeech.sm5.12blks.rh -contrast music-vs-fix -a 1 -a 2 -a 3 -a 4 -a 5 -a 6 -c 0

auditory/musicspeech.sm5.lh/beta.nii.gz: ../musicspeech.sm5.lh/fix-vs-musicspeech.mat ../musicspeech.sm5.lh/speech-vs-fix.mat convertsm-auditory auditory/001/Music.Speech.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis musicspeech.sm5.lh

../musicspeech.sm5.lh/speech-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis musicspeech.sm5.lh -contrast speech-vs-fix -a 2 -c 0

../musicspeech.sm5.lh/music-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis musicspeech.sm5.lh -contrast music-vs-fix -a 1 -c 0

../musicspeech.sm5.lh/fix-vs-musicspeech.mat:
	cd .. ;\
	mkcontrast-sess -analysis musicspeech.sm5.lh -contrast fix-vs-musicspeech -a 0 -c 1 -c 2

auditory/musicspeech.sm5.rh/beta.nii.gz: ../musicspeech.sm5.rh/fix-vs-musicspeech.mat ../musicspeech.sm5.rh/speech-vs-fix.mat convertsm-auditory auditory/001/Music.Speech.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis musicspeech.sm5.rh

../musicspeech.sm5.rh/speech-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis musicspeech.sm5.rh -contrast speech-vs-fix -a 2 -c 0

../musicspeech.sm5.rh/music-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis musicspeech.sm5.rh -contrast music-vs-fix -a 1 -c 0

../musicspeech.sm5.rh/fix-vs-musicspeech.mat:
	cd .. ;\
	mkcontrast-sess -analysis musicspeech.sm5.rh -contrast fix-vs-musicspeech -a 0 -c 1 -c 2

fitvisualsm: visual/houseface.sm5.12blks.lh/beta.nii.gz visual/houseface.sm5.12blks.rh/beta.nii.gz visual/houseface.sm5.lh/beta.nii.gz visual/houseface.sm5.rh/beta.nii.gz

visual/houseface.sm5.12blks.lh/beta.nii.gz: ../houseface.sm5.12blks.lh/house-vs-fix.mat ../houseface.sm5.12blks.lh/face-vs-fix.mat convertsm-visual visual/001/House.Face.12blks.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis houseface.sm5.12blks.lh

../houseface.sm5.12blks.lh/face-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis houseface.sm5.12blks.lh -contrast face-vs-fix -a 7 -a 8 -a 9 -a 10 -a 11 -a 12 -c 0

../houseface.sm5.12blks.lh/house-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis houseface.sm5.12blks.lh -contrast house-vs-fix -a 1 -a 2 -a 3 -a 4 -a 5 -a 6 -c 0

visual/houseface.sm5.12blks.rh/beta.nii.gz: ../houseface.sm5.12blks.rh/house-vs-fix.mat ../houseface.sm5.12blks.rh/face-vs-fix.mat convertsm-visual visual/001/House.Face.12blks.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis houseface.sm5.12blks.rh

../houseface.sm5.12blks.rh/face-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis houseface.sm5.12blks.rh -contrast face-vs-fix -a 7 -a 8 -a 9 -a 10 -a 11 -a 12 -c 0

../houseface.sm5.12blks.rh/house-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis houseface.sm5.12blks.rh -contrast house-vs-fix -a 1 -a 2 -a 3 -a 4 -a 5 -a 6 -c 0

visual/houseface.sm5.lh/beta.nii.gz: ../houseface.sm5.lh/house-vs-fix.mat ../houseface.sm5.lh/face-vs-fix.mat convertsm-visual visual/001/House.Face.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis houseface.sm5.lh

../houseface.sm5.lh/face-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis houseface.sm5.lh -contrast face-vs-fix -a 2 -c 0

../houseface.sm5.lh/house-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis houseface.sm5.lh -contrast house-vs-fix -a 1 -c 0

visual/houseface.sm5.rh/beta.nii.gz: ../houseface.sm5.rh/house-vs-fix.mat ../houseface.sm5.rh/face-vs-fix.mat convertsm-visual visual/001/House.Face.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis houseface.sm5.rh

../houseface.sm5.rh/face-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis houseface.sm5.rh -contrast face-vs-fix -a 2 -c 0

../houseface.sm5.rh/house-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis houseface.sm5.rh -contrast house-vs-fix -a 1 -c 0

fitmotorsm: motor/rightleftm.sm5.12blks.lh/beta.nii.gz motor/rightleftm.sm5.12blks.rh/beta.nii.gz motor/rightleftm.sm5.lh/beta.nii.gz motor/rightleftm.sm5.rh/beta.nii.gz

motor/rightleftm.sm5.12blks.lh/beta.nii.gz: ../rightleftm.sm5.12blks.lh/right-vs-fix.mat ../rightleftm.sm5.12blks.lh/left-vs-fix.mat convertsm-motor motor/001/Right.Left.12blks.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis rightleftm.sm5.12blks.lh

../rightleftm.sm5.12blks.lh/left-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftm.sm5.12blks.lh -contrast left-vs-fix -a 7 -a 8 -a 9 -a 10 -a 11 -a 12 -c 0

../rightleftm.sm5.12blks.lh/right-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftm.sm5.12blks.lh -contrast right-vs-fix -a 1 -a 2 -a 3 -a 4 -a 5 -a 6 -c 0

motor/rightleftm.sm5.12blks.rh/beta.nii.gz: ../rightleftm.sm5.12blks.rh/right-vs-fix.mat ../rightleftm.sm5.12blks.rh/left-vs-fix.mat convertsm-motor motor/001/Right.Left.12blks.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis rightleftm.sm5.12blks.rh

../rightleftm.sm5.12blks.rh/left-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftm.sm5.12blks.rh -contrast left-vs-fix -a 7 -a 8 -a 9 -a 10 -a 11 -a 12 -c 0

../rightleftm.sm5.12blks.rh/right-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftm.sm5.12blks.rh -contrast right-vs-fix -a 1 -a 2 -a 3 -a 4 -a 5 -a 6 -c 0

motor/rightleftm.sm5.lh/beta.nii.gz: ../rightleftm.sm5.lh/right-vs-fix.mat ../rightleftm.sm5.lh/left-vs-fix.mat convertsm-motor motor/001/Right.Left.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis rightleftm.sm5.lh

../rightleftm.sm5.lh/left-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftm.sm5.lh -contrast left-vs-fix -a 2 -c 0

../rightleftm.sm5.lh/right-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftm.sm5.lh -contrast right-vs-fix -a 1 -c 0

motor/rightleftm.sm5.rh/beta.nii.gz: ../rightleftm.sm5.rh/right-vs-fix.mat ../rightleftm.sm5.rh/left-vs-fix.mat convertsm-motor motor/001/Right.Left.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis rightleftm.sm5.rh

../rightleftm.sm5.rh/left-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftm.sm5.rh -contrast left-vs-fix -a 2 -c 0

../rightleftm.sm5.rh/right-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftm.sm5.rh -contrast right-vs-fix -a 1 -c 0

fittactilesm: tactile/rightleftt.sm5.12blks.lh/beta.nii.gz tactile/rightleftt.sm5.12blks.rh/beta.nii.gz tactile/rightleftt.sm5.lh/beta.nii.gz tactile/rightleftt.sm5.rh/beta.nii.gz

tactile/rightleftt.sm5.12blks.lh/beta.nii.gz: ../rightleftt.sm5.12blks.lh/right-vs-fix.mat ../rightleftt.sm5.12blks.lh/left-vs-fix.mat convertsm-tactile tactile/001/Right.Left.12blks.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis rightleftt.sm5.12blks.lh

../rightleftt.sm5.12blks.lh/left-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftt.sm5.12blks.lh -contrast left-vs-fix -a 7 -a 8 -a 9 -a 10 -a 11 -a 12 -c 0

../rightleftt.sm5.12blks.lh/right-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftt.sm5.12blks.lh -contrast right-vs-fix -a 1 -a 2 -a 3 -a 4 -a 5 -a 6 -c 0

tactile/rightleftt.sm5.12blks.rh/beta.nii.gz: ../rightleftt.sm5.12blks.rh/right-vs-fix.mat ../rightleftt.sm5.12blks.rh/left-vs-fix.mat convertsm-tactile tactile/001/Right.Left.12blks.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis rightleftt.sm5.12blks.rh

../rightleftt.sm5.12blks.rh/left-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftt.sm5.12blks.rh -contrast left-vs-fix -a 7 -a 8 -a 9 -a 10 -a 11 -a 12 -c 0

../rightleftt.sm5.12blks.rh/right-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftt.sm5.12blks.rh -contrast right-vs-fix -a 1 -a 2 -a 3 -a 4 -a 5 -a 6 -c 0

tactile/rightleftt.sm5.lh/beta.nii.gz: ../rightleftt.sm5.lh/right-vs-fix.mat ../rightleftt.sm5.lh/left-vs-fix.mat convertsm-tactile tactile/001/Right.Left.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis rightleftt.sm5.lh

../rightleftt.sm5.lh/left-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftt.sm5.lh -contrast left-vs-fix -a 2 -c 0

../rightleftt.sm5.lh/right-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftt.sm5.lh -contrast right-vs-fix -a 1 -c 0

tactile/rightleftt.sm5.rh/beta.nii.gz: ../rightleftt.sm5.rh/right-vs-fix.mat ../rightleftt.sm5.rh/left-vs-fix.mat convertsm-tactile tactile/001/Right.Left.par
	cd .. ;\
	selxavg3-sess -s $(subject) -analysis rightleftt.sm5.rh

../rightleftt.sm5.rh/left-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftt.sm5.rh -contrast left-vs-fix -a 2 -c 0

../rightleftt.sm5.rh/right-vs-fix.mat:
	cd .. ;\
	mkcontrast-sess -analysis rightleftt.sm5.rh -contrast right-vs-fix -a 1 -c 0


.PHONY: convertall convertsm convertunsm

convertall: convertsm convertunsm
convertsm: convertsm-visual convertsm-auditory convertsm-motor
convertunsm: convertunsm-visual convertunsm-auditory convertunsm-motor

convertsm-visual: visual/001/fmcpr.sm5.mni305.2mm.nii.gz
	mri_convert -tr 2000 $(word 1,$^) $(word 1,$^) ;\
	mri_convert -tr 2000 visual/001/fmcpr.sm5.fsaverage.lh.nii.gz visual/001/fmcpr.sm5.fsaverage.lh.nii.gz ;\
	mri_convert -tr 2000 visual/001/fmcpr.sm5.fsaverage.rh.nii.gz visual/001/fmcpr.sm5.fsaverage.rh.nii.gz ;\
	touch convertsm-visual

convertsm-auditory: auditory/001/fmcpr.sm5.mni305.2mm.nii.gz
	mri_convert -tr 2000 $(word 1,$^) $(word 1,$^) ;\
	mri_convert -tr 2000 auditory/001/fmcpr.sm5.fsaverage.lh.nii.gz auditory/001/fmcpr.sm5.fsaverage.lh.nii.gz ;\
	mri_convert -tr 2000 auditory/001/fmcpr.sm5.fsaverage.rh.nii.gz auditory/001/fmcpr.sm5.fsaverage.rh.nii.gz ;\
	touch convertsm-auditory

convertsm-motor: motor/001/fmcpr.sm5.mni305.2mm.nii.gz
	mri_convert -tr 2000 $(word 1,$^) $(word 1,$^) ;\
	mri_convert -tr 2000 motor/001/fmcpr.sm5.fsaverage.lh.nii.gz motor/001/fmcpr.sm5.fsaverage.lh.nii.gz ;\
	mri_convert -tr 2000 motor/001/fmcpr.sm5.fsaverage.rh.nii.gz motor/001/fmcpr.sm5.fsaverage.rh.nii.gz ;\
	touch convertsm-motor

convertsm-tactile: tactile/001/fmcpr.sm5.mni305.2mm.nii.gz
	mri_convert -tr 2000 $(word 1,$^) $(word 1,$^) ;\
	mri_convert -tr 2000 tactile/001/fmcpr.sm5.fsaverage.lh.nii.gz tactile/001/fmcpr.sm5.fsaverage.lh.nii.gz ;\
	mri_convert -tr 2000 tactile/001/fmcpr.sm5.fsaverage.rh.nii.gz tactile/001/fmcpr.sm5.fsaverage.rh.nii.gz ;\
	touch convertsm-tactile

convertunsm-visual: visual/001/fmcpr.sm0.mni305.2mm.nii.gz
	mri_convert -tr 2000 $(word 1,$^) $(word 1,$^) ;\
	mri_convert -tr 2000 visual/001/fmcpr.sm0.fsaverage.lh.nii.gz visual/001/fmcpr.sm0.fsaverage.lh.nii.gz ;\
	mri_convert -tr 2000 visual/001/fmcpr.sm0.fsaverage.rh.nii.gz visual/001/fmcpr.sm0.fsaverage.rh.nii.gz ;\
	touch convertunsm-visual

convertunsm-auditory: auditory/001/fmcpr.sm0.mni305.2mm.nii.gz
	mri_convert -tr 2000 $(word 1,$^) $(word 1,$^) ;\
	mri_convert -tr 2000 auditory/001/fmcpr.sm0.fsaverage.lh.nii.gz auditory/001/fmcpr.sm0.fsaverage.lh.nii.gz ;\
	mri_convert -tr 2000 auditory/001/fmcpr.sm0.fsaverage.rh.nii.gz auditory/001/fmcpr.sm0.fsaverage.rh.nii.gz ;\
	touch convertunsm-auditory

convertunsm-motor: motor/001/fmcpr.sm0.mni305.2mm.nii.gz
	mri_convert -tr 2000 $(word 1,$^) $(word 1,$^) ;\
	mri_convert -tr 2000 motor/001/fmcpr.sm0.fsaverage.lh.nii.gz motor/001/fmcpr.sm0.fsaverage.lh.nii.gz ;\
	mri_convert -tr 2000 motor/001/fmcpr.sm0.fsaverage.rh.nii.gz motor/001/fmcpr.sm0.fsaverage.rh.nii.gz ;\
	touch convertunsm-motor

convertunsm-tactile: tactile/001/fmcpr.sm0.mni305.2mm.nii.gz
	mri_convert -tr 2000 $(word 1,$^) $(word 1,$^) ;\
	mri_convert -tr 2000 tactile/001/fmcpr.sm0.fsaverage.lh.nii.gz tactile/001/fmcpr.sm0.fsaverage.lh.nii.gz ;\
	mri_convert -tr 2000 tactile/001/fmcpr.sm0.fsaverage.rh.nii.gz tactile/001/fmcpr.sm0.fsaverage.rh.nii.gz ;\
	touch convertunsm-tactile


.PHONY: preprocall
.PHONY: preprocsm preprocsm-visual preprocsm-auditory preprocsm-motor preprocsm-tactile
.PHONY: preprocunsm preprocunsm-visual preprocunsm-auditory preprocunsm-motor preprocunsm-tactile

preprocall: preprocsm preprocunsm
preprocsm: preprocsm-visual preprocsm-auditory preprocsm-motor
preprocunsm: preprocunsm-visual preprocunsm-auditory preprocunsm-motor

preprocsm-visual: visual/001/fmcpr.sm5.mni305.2mm.nii.gz
preprocsm-auditory: auditory/001/fmcpr.sm5.mni305.2mm.nii.gz
preprocsm-motor: motor/001/fmcpr.sm5.mni305.2mm.nii.gz
preprocsm-tactile: tactile/001/fmcpr.sm5.mni305.2mm.nii.gz

preprocunsm-visual: visual/001/fmcpr.sm0.mni305.2mm.nii.gz
preprocunsm-auditory: auditory/001/fmcpr.sm0.mni305.2mm.nii.gz
preprocunsm-motor: motor/001/fmcpr.sm0.mni305.2mm.nii.gz
preprocunsm-tactile: tactile/001/fmcpr.sm0.mni305.2mm.nii.gz

visual/001/fmcpr.sm5.mni305.2mm.nii.gz: visual/001/f.nii subjectname
	cd .. ;\
	preproc-sess -s $(subject) -surface fsaverage lhrh -mni305 -fwhm 5 -per-run -fsd visual

auditory/001/fmcpr.sm5.mni305.2mm.nii.gz: auditory/001/f.nii subjectname
	cd .. ;\
	preproc-sess -s $(subject) -surface fsaverage lhrh -mni305 -fwhm 5 -per-run -fsd auditory

motor/001/fmcpr.sm5.mni305.2mm.nii.gz: motor/001/f.nii subjectname
	cd .. ;\
	preproc-sess -s $(subject) -surface fsaverage lhrh -mni305 -fwhm 5 -per-run -fsd motor

tactile/001/fmcpr.sm5.mni305.2mm.nii.gz: tactile/001/f.nii subjectname
	cd .. ;\
	preproc-sess -s $(subject) -surface fsaverage lhrh -mni305 -fwhm 5 -per-run -fsd tactile


visual/001/fmcpr.sm0.mni305.2mm.nii.gz: visual/001/f.nii subjectname
	cd .. ;\
	preproc-sess -s $(subject) -surface fsaverage lhrh -mni305 -fwhm 0 -per-run -fsd visual

auditory/001/fmcpr.sm0.mni305.2mm.nii.gz: auditory/001/f.nii subjectname
	cd .. ;\
	preproc-sess -s $(subject) -surface fsaverage lhrh -mni305 -fwhm 0 -per-run -fsd auditory

motor/001/fmcpr.sm0.mni305.2mm.nii.gz: motor/001/f.nii subjectname
	cd .. ;\
	preproc-sess -s $(subject) -surface fsaverage lhrh -mni305 -fwhm 0 -per-run -fsd motor

tactile/001/fmcpr.sm0.mni305.2mm.nii.gz: tactile/001/f.nii subjectname
	cd .. ;\
	preproc-sess -s $(subject) -surface fsaverage lhrh -mni305 -fwhm 0 -per-run -fsd tactile

subjectname:
	echo $(stripsubject) > subjectname


.PHONY: linktopar linktoparvis linktoparaud linktoparmot linktopartact

linktopar: linktoparvis linktoparaud linktoparmot

linktoparvis: visual/001/House.Face.par visual/001/House.Face.12blks.par
linktoparaud: auditory/001/Music.Speech.par auditory/001/Music.Speech.12blks.par
linktoparmot: motor/001/Right.Left.par motor/001/Right.Left.12blks.par
linktopartact: tactile/001/Right.Left.par tactile/001/Right.Left.12blks.par

visual/001/House.Face.par:
	ln -s /nfs/tpolk/mind/lib/House.Face.par visual/001/House.Face.par

auditory/001/Music.Speech.par:
	ln -s /nfs/tpolk/mind/lib/Music.Speech.par auditory/001/Music.Speech.par

motor/001/Right.Left.par:
	ln -s /nfs/tpolk/mind/lib/Right.Left.par motor/001/Right.Left.par

tactile/001/Right.Left.par: tactile/001/lon.txt tactile/001/ron.txt tactile/001/fon.txt tactile/001/ldur.txt tactile/001/rdur.txt tactile/001/fdur.txt
	matlab -nosplash -nodesktop -r "try, makeparfile2('$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$(word 5,$^)', '$(word 6,$^)'), catch, 'Error running makeparfile2', end; exit"	

visual/001/House.Face.12blks.par:
	ln -s /nfs/tpolk/mind/lib/House.Face.12blks.par visual/001/House.Face.12blks.par

auditory/001/Music.Speech.12blks.par:
	ln -s /nfs/tpolk/mind/lib/Music.Speech.12blks.par auditory/001/Music.Speech.12blks.par

motor/001/Right.Left.12blks.par:
	ln -s /nfs/tpolk/mind/lib/Right.Left.12blks.par motor/001/Right.Left.12blks.par

tactile/001/Right.Left.12blks.par: tactile/001/lon.txt tactile/001/ron.txt tactile/001/fon.txt tactile/001/ldur.txt tactile/001/rdur.txt tactile/001/fdur.txt
	matlab -nosplash -nodesktop -r "try, makeparfile12('$(word 1,$^)', '$(word 2,$^)', '$(word 3,$^)', '$(word 4,$^)', '$(word 5,$^)', '$(word 6,$^)'), catch, 'Error running makeparfile12', end; exit"	



print-%  : ; @echo $* = $($*)
