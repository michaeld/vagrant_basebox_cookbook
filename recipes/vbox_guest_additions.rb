package "dkms"
package "gcc"
package "kernel-devel"

directory "/mnt/vbox_iso"

mount "/mnt/vbox_iso" do
	device "/tmp/VBoxGuestAdditions_4.2.12.iso"
	options ["loop"]
end

execute "sh /mnt/vbox_iso/VBoxLinuxAdditions.run"
