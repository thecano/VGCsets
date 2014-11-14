working_directory "/root/VGCsets"

# Unicorn PID file location
# # pid "/path/to/pids/unicorn.pid"
 pid "/root/VGCsets/pids/unicorn.pid"
#
# # Path to logs
# # stderr_path "/path/to/log/unicorn.log"
# # stdout_path "/path/to/log/unicorn.log"
 stderr_path "/root/VGCsets/log/unicorn.log"
 stdout_path "/root/VGCsets/log/unicorn.log"
#
# # Unicorn socket
 #listen "/tmp/unicorn.vgcsets.sock"
 listen "/var/sockets/unicorn.myapp.sock"
#
# # Number of processes
# # worker_processes 4
 worker_processes 2
#
# # Time-out
 timeout 30
