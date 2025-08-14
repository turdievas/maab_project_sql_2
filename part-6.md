1.Step General Page

<img width="937" height="914" alt="Image" src="https://github.com/user-attachments/assets/34c49908-2889-4031-832c-d92656822ec2" />

Give the name 
Do not change the owner
Write some descriptions if you will.

2.Step

<img width="951" height="819" alt="Image" src="https://github.com/user-attachments/assets/b336377b-76cf-4b19-9c53-77c92fbda8be" />

Click on Steps and then click New.

Step Name: Load CSV Step

Type: Transact-SQL script (T-SQL)

Database: Select the database where your table resides.

Command: Put your sql query

Click OK to save the step.

3.Step

<img width="871" height="744" alt="Image" src="https://github.com/user-attachments/assets/234f8f76-7074-451c-b95f-d8f01a05b723" />

Click on Schedules and then click New.

Name: Daily Schedule

Schedule Type: Recurring

Set Frequency to Daily, and specify the time you want the job to run.

Click OK to save the schedule.

Repeat the process to create another schedule for the weekly job:

Name: Weekly Schedule
Frequency: Set to Weekly, and choose a day and time.

After doing all that 
We can check if all is working
We got success message.
![Image](https://github.com/user-attachments/assets/b0eb39de-c8b8-4ece-a432-ab84d272a93d)
