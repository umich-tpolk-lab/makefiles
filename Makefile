SHELL := /bin/bash

srtprun_01.nii : rtprun_01.nii
	matlab -nosplash -nodesktop -r "try, spm_smooth('$<','$@',[8 8 8]), catch, 'Error running spm_smooth', end; exit"
