# tailscale_container_enable
Bash script to enable a tun device in a Proxmox LXC container

## Symptoms
```
>> sudo tailscale up
failed to connect to local tailscaled; it doesn't appear to be running (sudo systemctl start tailscaled ?)
```

(issue persists despite `sudo systemctl start tailscaled.service`)

## Cause
See: [Tailscale in LXC containers](https://tailscale.com/kb/1130/lxc-unprivileged/)

## Install
`git clone https://github.com/domRG/tailscale_container_enable.git`
`chmod +x ./tailscale_container_enable/tailscale_container_enable.sh`
then add the repo-directory to your PATH in `~/.bashrc` if you wish to invoke this without the full directory reference.

## Run
`tailscale_container_enable.sh 104`
or
`/path/to/location/tailscale_container_enable.sh 104`

## Caveats
tested on:
```
>> pveversion
pve-manager/7.3-3/c3928077 (running kernel: 5.15.39-3-pve)
```
