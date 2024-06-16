import SwiftUI

struct ToDoListView: View {
    @State private var showSettings = false
    @State private var showAddTask = false
    @State private var tasks: [Task] = []
    @State private var completedTasks: [Task] = []
    @State private var showCompletedTasks = false
    @State private var selectedTask: Task?
    
    var body: some View {
        VStack {
            // ToDo List
            VStack {
                HStack {
                    Text("To Do List")
                        .font(.title)
                        .foregroundColor(Color(red: 90/255, green: 114/255, blue: 98/255))
                    Spacer()
                    Button(action: {
                        showAddTask.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color(red: 179/255, green: 189/255, blue: 182/255))
                            .font(.largeTitle)
                    }
                }
                .padding()
                
                List {
                    ForEach(tasks) { task in
                        HStack {
                            Button(action: {
                                markTaskAsCompleted(task: task)
                            }) {
                                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            VStack(alignment: .leading) {
                                Text(task.title)
                                    .font(.headline)
                                HStack {
                                    Text(task.dueDate, style: .date)
                                    Spacer()
                                    Text(task.subject)
                                    Spacer()
                                    Text(task.priority.rawValue)
                                }
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            }
                            .padding()
                            .onTapGesture {
                                selectedTask = task
                            }
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                deleteTask(task: task)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
                
                if !completedTasks.isEmpty {
                    HStack {
                        Text("Completed Tasks")
                            .font(.headline)
                            .foregroundColor(Color(red: 90/255, green: 114/255, blue: 98/255))
                        Spacer()
                        Button(action: {
                            showCompletedTasks.toggle()
                        }) {
                            Image(systemName: showCompletedTasks ? "chevron.up" : "chevron.down")
                                .foregroundColor(Color(red: 179/255, green: 189/255, blue: 182/255))
                        }
                    }
                    .padding()
                    
                    if showCompletedTasks {
                        List {
                            ForEach(completedTasks) { task in
                                VStack(alignment: .leading) {
                                    Text(task.title)
                                        .font(.headline)
                                    HStack {
                                        Text(task.dueDate, style: .date)
                                        Spacer()
                                        Text(task.subject)
                                        Spacer()
                                        Text(task.priority.rawValue)
                                    }
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                }
                                .padding()
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $showAddTask) {
                AddTaskView(tasks: $tasks)
            }
            .sheet(item: $selectedTask) { task in
                TaskDetailView(task: task)
            }
        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
    }
    
    func deleteTask(task: Task) {
        tasks.removeAll { $0.id == task.id }
    }
    
    func markTaskAsCompleted(task: Task) {
        tasks.removeAll { $0.id == task.id }
        completedTasks.append(task)
    }
}

struct Task: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var dueDate: Date
    var subject: String
    var reminder: ReminderOption
    var priority: Priority
    var isCompleted: Bool = false
}

enum ReminderOption: String, CaseIterable {
    case none = "None"
    case atTimeOfEvent = "At time of event"
    case fiveMinutesBefore = "5 minutes before"
    case fifteenMinutesBefore = "15 minutes before"
    case thirtyMinutesBefore = "30 minutes before"
    case oneHourBefore = "1 hour before"
    case oneDayBefore = "1 day before"
    case oneWeekBefore = "1 week before"
}

enum Priority: String, CaseIterable {
    case high = "High"
    case medium = "Medium"
    case low = "Low"
}

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var tasks: [Task]
    
    @State private var title = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @State private var subject = ""
    @State private var reminder: ReminderOption = .none
    @State private var priority: Priority = .medium
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                }

                
                Section(header: Text("Additional Information")) {
                    TextField("Subject", text: $subject)
                    Picker("Reminder", selection: $reminder) {
                        ForEach(ReminderOption.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    Picker("Priority", selection: $priority) {
                        ForEach(Priority.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                }
                
                Button(action: {
                    let newTask = Task(title: title, description: description, dueDate: dueDate, subject: subject, reminder: reminder, priority: priority)
                    tasks.append(newTask)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Add Task")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: 200, maxHeight: 44)
                        .background(Color(red: 71/255, green: 99/255, blue: 77/255))
                        .cornerRadius(10)
                }
            }
            .navigationBarTitle("Add New Task", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(Color(red: 179/255, green: 189/255, blue: 182/255))
            })
        }
    }
}

struct TaskDetailView: View {
    @State var task: Task
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text(task.title)
                .font(.largeTitle)
                .padding()
            
            Text("Description: \(task.description)")
                .padding()
            
            Text("Due Date: \(task.dueDate, style: .date)")
                .padding()
            
            Text("Subject: \(task.subject)")
                .padding()
            
            Text("Reminder: \(task.reminder.rawValue)")
                .padding()
            
            Text("Priority: \(task.priority.rawValue)")
                .padding()
            
            Spacer()
            
            Button(action: {
                // Code to edit the task
            }) {
                Text("Edit")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 44)
                    .background(Color(red: 71/255, green: 99/255, blue: 77/255))
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }
}

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: AccountDetailsView()) {
                    Text("Account Details")
                }
                NavigationLink(destination: PrivacySettingsView()) {
                    Text("Privacy Settings")
                }
                NavigationLink(destination: NotificationsSettingsView()) {
                    Text("Notification Settings")
                }
                NavigationLink(destination: HelpSupportView()) {
                    Text("Help & Support")
                }
                NavigationLink(destination: AboutView()) {
                    Text("About")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct AccountDetailsView: View {
    var body: some View {
        Text("Account Details")
    }
}

struct PrivacySettingsView: View {
    var body: some View {
        Text("Privacy Settings")
    }
}

struct NotificationsSettingsView: View {
    var body: some View {
        Text("Notification Settings")
    }
}

struct HelpSupportView: View {
    var body: some View {
        Text("Help & Support")
    }
}

struct AboutView: View {
    var body: some View {
        Text("About")
    }
}
#Preview {
    ToDoListView()
}
