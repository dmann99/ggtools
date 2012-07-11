David Mann
GGLAG lag capture and graphing script

This monitor will graph today's Golden Gate Lag data. 

Required environment variables (usually exist in the ~/.bashrc of the 
 user executing the script):
MONITORDIR
ORACLE_SID
GGSDIR

Instructions:

1) Copy the current files and directory structure to /u01/app/monitor/gglag or your preferred directory. 
This will be the MONITORDIR

Change permissions to make script executable. 

chmod 755 getData.sh

2) Edit format.gnu to have PLOT lines for each GGS Extract or Replicat group 
   you would like to graph:

"< cat data/ggsdataDATE.txt | grep [GROUP NAME]" using 2:3 with lines title "[GROUP NAME]"

3) Create a cron job to execute every 15 minutes:
0,15,30,45 * * * * /u01/app/monitor/gglag/getData.sh

4) When getData.sh runs:
   A data file will be written to ./data (i.e. ggsdata2007-01-11.txt)
   A graph will be written to ./plots (i.e. 2007-01-11-LagTime-RDBA.png)

Change Log:
21-MAR-2012 Released 0.9
07-JUL-2012 Check in to GitHub, tidy licenses


Licensing:

Copyright (c) 2012, David Mann
All rights reserved.

Redistribution and use in source and binary forms, with or without 
modification, are permitted provided that the following conditions are met:

o Redistributions of source code must retain the above copyright notice, this 
  list of conditions and the following disclaimer.

o Redistributions in binary form must reproduce the above copyright notice, 
  this list of conditions and the following disclaimer in the documentation 
  and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE 
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL 
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR 
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
