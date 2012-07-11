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



Licensing:
  Copyright 2012 David Mann

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

Change Log:
21-MAR-2012 Released 0.9