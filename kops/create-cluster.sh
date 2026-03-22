#!/usr/bin/env bash

create_cluster_bastion () {
    kops create cluster \
                --api-loadbalancer-type public \
                --bastion \
                --bastion-image Ubuntu22.04.jammy.kvm \
                --cloud openstack \
                --control-plane-count=1 \
                --control-plane-size k8.medium \
                --dns none \
                --dry-run \
                --etcd-storage-type ceph \
                --image Ubuntu22.04.jammy.kvm \
                --name my-cluster.k8s.local \
                --node-count=3 \
                --node-size k8.medium \
                --network-cidr 10.0.2.0/24 \
                --networking cilium-etcd \
                --os-dns-servers "10.0.0.81" \
                --os-ext-net Internet \
                --os-kubelet-ignore-az \
                --os-octavia \
                --os-octavia-provider amphora \
                --ssh-public-key ~/.ssh/id_ed25519.pub \
                --state swift://k8s-kops-states \
                --topology private \
                --zones nova \
                -oyaml > kops_create_cluster.yaml
}

create_cluster() {
    kops create cluster \
                --api-loadbalancer-type public \
                --cloud openstack \
                --control-plane-count 1 \
                --control-plane-size k8.medium \
                --dns none \
                --dry-run \
                --etcd-storage-type ceph \
                --image Ubuntu22.04.jammy.kvm \
                --name my-cluster.k8s.local \
                --node-count=3 \
                --node-size k8.medium \
                --network-cidr 10.0.2.0/24 \
                --networking cilium-etcd \
                --os-dns-servers "10.0.0.81" \
                --os-ext-net Internet \
                --os-kubelet-ignore-az \
                --os-octavia \
                --os-octavia-provider amphora \
                --ssh-public-key ~/.ssh/id_ed25519.pub \
                --state swift://k8s-kops-states \
                --topology private \
                --zones nova \
                -oyaml > kops_create_cluster.yaml
}

create_cluster
