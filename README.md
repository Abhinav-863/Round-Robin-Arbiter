# Round-Robin-Arbiter
This project implements a Round Robin Variable Time Arbitration module in Verilog. The module is designed to prioritize and serve requests from multiple sources in a round-robin fashion with variable time intervals. It is suitable for applications where fair access to a shared resource is essential, such as in networking, memory controllers, or any system with multiple entities contending for a resource.

Features
Round Robin Arbitration: The module follows a round-robin scheduling algorithm, ensuring fair access to the shared resource for all requesting entities.
Variable Time Intervals: The arbitration module introduces variable time intervals for each state, allowing for customization based on the specific requirements of the application.
Configurable States: The module supports configurable states, allowing users to define the number and nature of states based on the specific needs of their system.
Asynchronous Reset: The module includes an asynchronous reset feature to ensure a well-defined initial state during system startup.
Parameters
Ideal State: The default state when no requests are pending.
State 0-3: Customizable states corresponding to different entities contending for the resource.
Inputs
clk: Clock input.
rst: Asynchronous reset input.
req[3:0]: Request inputs from different entities.
Outputs
out[3:0]: Output indicating the selected entity based on the current state.
How to Use
Instantiation: Instantiate the round_robin_variable_time module in your Verilog design.
Parameters: Adjust the module parameters, such as ideal state and custom states, to match your system requirements.
Clock and Reset: Connect the clock and asynchronous reset signals to your system's clock and reset sources.
Requests: Connect the request signals (req[3:0]) from the contending entities to the module.
Output: Utilize the output signal (out[3:0]) to determine which entity is granted access to the shared resource.
