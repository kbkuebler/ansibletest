# ansibletest
Testing out automation with Ansible.

# Ansible in Pure Storage Test Drive

This project was born out of a need to show our customers (and potential customers) a simple, concise, example of how valuable automation could be in their environment.

## Playbooks

The playbooks are straightforward, and actually demonstrate many of the things that Ansible is great at doing.

* 0_GetInfo.yaml - Shows a simple method of gathering data - Requires vault password of **pure**.
* 1_ModHost.yaml - Fixes some inconsistent capitalization between the host and the array.
* 2_CreateVol.yaml - You can see how Anible will create, map, format, mount, and edit /etc/fstab, all in one easy command.
* 3_CreateActiveCluster.yaml - Shameless stolen from @sdodsley, this will create a synchronous relationship between 2 Flasharrays and protect our volume
* 4_CreateSnaps.yaml - Creates a snapshot of our new volume, copies it to a new volume, and then mounts it on our test linux server
* 5_Dev_Snaps.yaml - Hand this off to your development team and they will be able to refresh data on their own! No need to involve a storage admin.

As you can see, they are simple, self describing, and above all, *functional*. We would love to provide you with a Pure Test Drive voucher so you can try these out on your own!

Click the link for more about [Pure Test Drive](https://www.purestorage.com/products/flasharray-x/test-drive.html)
