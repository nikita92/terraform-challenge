# terraform-challenge

This Terraform project sets up a Virtual Private Cloud (VPC) on AWS with 1 public subnet and 2 private subnets. It also provisions an EC2 instance within one of the private subnets that allows SSH access from both private subnets.

### Assumptions

1. **CIDR Blocks:**
   - The VPC will be created with the CIDR block "10.0.0.0/16".
   - The public subnet will use the CIDR block "10.0.1.0/24".
   - The first private subnet will use the CIDR block "10.0.2.0/24".
   - The second private subnet will use the CIDR block "10.0.3.0/24".

2. **AWS Region:**
   - The Terraform code is set to deploy resources in the "us-west-2" (Oregon) AWS region.
   - If you want to deploy in a different region, please update the "provider" block in `main.tf`.

3. **AMI ID and Instance Type:**
   - The EC2 instance will use the Amazon Linux 2 AMI with ID "ami-0c55b159cbfafe1f0".
   - The instance type will be set to "t2.micro". You can change it to any other supported instance type in `modules/ec2/main.tf`.

4. **SSH Access:**
   - SSH access to the EC2 instance is allowed from both private subnets using Security Group rules.
   - The Security Group allowing SSH access is associated with the EC2 instance created in the first private subnet.

5. **Dependency on VPC Module:**
   - The subnet and EC2 modules assume that the VPC module will be used as a dependency.
   - The VPC module is responsible for creating the main VPC and enabling DNS hostnames.

### Usage

1. **Clone the Repository:**
   ```
   git clone git@github.com:nikita92/terraform-challenge.git
   cd terraform-challenge
   ```

2. **Terraform Initialization:**
   ```
   terraform init
   ```

3. **Terraform Apply:**
   ```
   terraform apply
   ```

4. **Terraform Destroy (Cleanup):**
   ```
   terraform destroy
   ```

Below is the directory structure for reference:

terraform-vpc-ec2-example/
  ├── modules/
  │   ├── vpc/
  │   │   ├── main.tf
  │   │   ├── variables.tf
  │   │   └── outputs.tf
  │   ├── subnet/
  │   │   ├── main.tf
  │   │   ├── variables.tf
  │   │   └── outputs.tf
  │   └── ec2/
  │       ├── main.tf
  │       ├── variables.tf
  │       └── outputs.tf
  ├── main.tf
  ├── variables.tf
  └── outputs.tf

terraform-vpc-ec2-example/
  ├── modules/
  │   ├── vpc/
  │   │   ├── main.tf
  │   │   ├── variables.tf
  │   │   └── outputs.tf
  │   ├── subnet/
  │   │   ├── main.tf
  │   │   ├── variables.tf
  │   │   └── outputs.tf
  │   └── ec2/
  │       ├── main.tf
  │       ├── variables.tf
  │       └── outputs.tf
  ├── main.tf
  ├── variables.tf
  └── outputs.tf
   