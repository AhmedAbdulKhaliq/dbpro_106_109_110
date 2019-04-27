#include "Process.cpp"

int averageWaitingTime(Process allProcesses[], int con);
int averageTurnAroundTime(Process allProcesses[], int con);

int main()
{
     //from <sstream>
    int Input;
    int num_processes;
    while(Input != 1 && Input !=2) {
        cout << "Enter 1 to perform task 1 or 2 to perform task 2?"<<endl;
        cin >> Input;
    }
    cout << "Enter number of processes?"<<endl;
    cin >> num_processes;
    Process processes[num_processes];
    for(int i = 0; i < num_processes; i++) {
        Process process;
        stringstream convert;
        convert << i;
        process.processId = process.processId + convert.str();
        cout << "Enter Burst Time for Process with id = " << process.processId << endl;
        cin >> process.burstTime;
        if(Input == 2) {
            cout << "Enter Arrival Time for Process with id = " << process.processId << endl;
            cin >> process.arrivalTime;
        }
        processes[i] = process;
    }
    for(int i = 0; i < num_processes; i++) {
        cout << "-----------------------------------------------------------" << endl;
        cout << "Process_Id = " << processes[i].processId << endl;
        cout << "Arrival Time = " << processes[i].arrivalTime << endl;
        cout << "Burst Time = " << processes[i].burstTime << endl;
        cout << "Turn Around Time = " << processes[i].calculateTurnAroundTime() << endl;
        cout << "Waiting Time = " << processes[i].calculateWaitingTime() << endl;
    }
    cout << "-----------------------------------------------------------" << endl;
    cout << "Average Turn Around Time = " << averageTurnAroundTime(processes, num_processes) << endl;
    cout << "Average Waiting Time = " << averageWaitingTime(processes, num_processes) << endl;
    return 0;
}
int averageWaitingTime(Process allProcesses[], int con) {
    int total = 0;
    for(int i = 0; i < con; i++) {
        total += allProcesses[i].calculateWaitingTime();
    }
    return total / con;
}
int averageTurnAroundTime(Process allProcesses[], int con) {
    int total = 0;
    for(int i = 0; i < con; i++) {
        total += allProcesses[i].calculateTurnAroundTime();
    }
    return total / con;
}
