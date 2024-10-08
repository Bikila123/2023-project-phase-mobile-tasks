# go_router_task

Flutter project with go_router 

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## App's Functionality 
1. Screen Navigation  
- The go_router app features has three screens: the home page, which displays the to-do list; the create task screen, where users can add a task with a title, description, and deadline; and the task detail screen, which shows the selected task from the home page and includes an edit option.

2. Named Routes 
- This app defines three named go_router: the default route ('home'), 'task_detail', and 'create_task', each with navigation functionality.

3. Passing Data Between Screens
- In this app, when the user clicks on a task from the to-do list page, the details of that task are displayed on the task detail page.

4. Navigation Animation 
- A custom transition route has been implemented to enhance the app's user experience, and the back arrow on both the task detail and create task screens navigates the user back to the home page when clicked.

## How to Run
1. Clone Repository 
   - git clone https://github.com/Bikila123/2023-project-phase-mobile-tasks/tree/master/on-boarding/go_router_task
2. Run the app on IDE
- home page will be showed on your first run of the app with todo list 
3. Task Detail
- click Task from task list
- task detail with update option displayed
- click "Update Task" that will take you to home page
- click arrow back on the top of the page to go back to home page
4. Create Task
- click "Create Task" button that will display Creat Task page
- fill the form and click "Add Task" button that will redirect you to home page
- click arrow back on the top of the page to go back to home page

 ## Clean Architecture
- assets/todo_data.json used as list of existing tasks 
- task details page updated with is completed checkbox added 
- all files are separated accordingly in clean architecture components 

   # go enjoy your app!
