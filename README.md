# Secure Networking Environment

The goal of this project was to demonstrate one aspect of creating a secure networking environment using AWS VPC and EC2. The 
setup demonstrates the AWS architectual best practice of allowing users to perform actions at a distance via the use of a
bastion host to provide indirect access to an internal app hosted in a private subnet.

### VPC Setup

The VPC has a public subnet containing a public facing app hosted on an EC2 instance, a second EC2 instance used as a bastion
host, and a NAT gateway.
The purpose of the bastion host is to allow authorized users to authenticate and then connect to an internal application hosted
on an EC2 instance in a private subnet.
The NAT gateway exists in the public subnet to allow the internal application hosted in the private subnet to connect to the
public internet.

### Security Groups

2 security groups are used to secure the resources in our VPC. 
1. Attached to the bastion host is a security group with an inbound rule that allows ssh traffic on port 22 from my local
IP address. In a production setting this would be configured to allow traffic from the businesses network.
2. The second security group is attached to the EC2 instance hosting the internal application in the private subnet. This security
group only allows SSH traffic originating from the bastion host.

