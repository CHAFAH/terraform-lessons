

---

# **Exercise 1: Configure AWS Access Keys**

1. **Objective**: Set up programmatic access to AWS by creating access keys.
2. **Instructions**:
   - Go to the [AWS IAM Console](https://console.aws.amazon.com/iam/).
   - Create a new IAM user with **programmatic access** only (no console access).
   - Download the access key ID and secret access key for this user.

3. **Expected Outcome**:
   - You have a new IAM user with an **Access Key ID** and **Secret Access Key** to use with AWS CLI and Terraform.

---

### **Exercise 2: Create an AWS CLI Profile**

1. **Objective**: Configure a named AWS CLI profile to manage AWS resources.
2. **Instructions**:
   - Open your terminal and configure a new AWS CLI profile using the access keys from **Exercise 1**:

     ```bash
     aws configure --profile develop
     ```

   - Enter the **Access Key ID**, **Secret Access Key**, and **Default region name** (e.g., `us-east-1`) when prompted.

3. **Expected Outcome**:
   - A new AWS CLI profile named `develop` that can be used to authenticate Terraform with AWS.

---

### **Exercise 3: Create an AWS EC2 Instance (Without Variables)**

1. **Objective**: Write a basic Terraform configuration to create an EC2 instance without using variables.
2. **Instructions**:
   - `mkdir exercise-3`
   - In a project directory, create a `main.tf` file.
   - Define the AWS provider with `region` and `profile` hardcoded.
   - Define an `aws_instance` resource with `ami`, `instance_type`, and `tags` hardcoded.

3. **Expected Outcome**:
   - An EC2 instance is created in AWS using Terraform, with static values for its AMI, instance type, and tags.

---

### **Exercise 4: Create the Same EC2 Instance Using Variables**

1. **Objective**: Modify the `main.tf` configuration to use variables instead of hardcoded values.
2. **Instructions**:
   - `mkdir exercise-4`
   - Create a `variables.tf` file to define the following variables:
     - `region`
     - `profile`
     - `ami`
     - `instance_type`
     - `tags` (as a map for Name and Environment)
   - In `main.tf`, replace hardcoded values with references to these variables.
   - Provide default values in `variables.tf` for `region`, `profile`, and `instance_type`.

3. **Expected Outcome**:
   - The EC2 instance is created using values from variables rather than hardcoded values, making the configuration more flexible.

---

### **Exercise 5: Create Environment-Specific Variables with `.tfvars`**

1. **Objective**: Use environment-specific `.tfvars` files to manage different configurations.
2. **Instructions**:
   - `mkdir exercise-5`
   - In the project directory, create a `dev.tfvars` file.
   - Set different values in `dev.tfvars` for `ami`, `instance_type`, and `tags`.
   - Run `terraform apply` with the `dev.tfvars` file to apply the configuration.

     ```bash
     terraform apply -var-file="dev.tfvars"
     ```

3. **Expected Outcome**:
   - The configuration applies with values specific to the `dev.tfvars` file, showing how to manage environment-specific configurations.

---

### **Exercise 6: Create a Security Group for EC2 Instances**

1. **Objective**: Define a security group for SSH access in your Terraform configuration.
2. **Instructions**:
   - In `main.tf`, add an `aws_security_group` resource with rules to allow SSH access (port 22).
   - Associate this security group with your EC2 instance by adding `vpc_security_group_ids` in the `aws_instance` resource.

3. **Expected Outcome**:
   - The EC2 instance is deployed with an attached security group that allows SSH access.

---

### **Exercise 7: Create a Reusable Module for EC2 Instances**

1. **Objective**: Organize your Terraform configuration by creating a module for EC2 instances.
2. **Instructions**:
   - In your project directory, create a `modules` folder with an `ec2_instance` subfolder.
   - Move the EC2 instance configuration to `modules/ec2_instance/main.tf`.
   - Define variables in `modules/ec2_instance/variables.tf` for `ami`, `instance_type`, `tags`, and `security_groups`.
   - Reference this module in the root `main.tf` file using the `source` keyword, and pass the necessary values.

3. **Expected Outcome**:
   - The EC2 instance is created using the module, and you now have a reusable EC2 module for future projects.

---

### **Exercise 8: Use Multiple Modules in the Main Configuration**

1. **Objective**: Add another module (e.g., `security_group`) to manage the EC2 instance’s security separately.
2. **Instructions**:
   - Create a `security_group` module in the `modules` folder.
   - Define a security group resource in `modules/security_group/main.tf`.
   - Reference both `ec2_instance` and `security_group` modules in the root `main.tf`, passing the security group output to the EC2 module.

3. **Expected Outcome**:
   - The EC2 instance is deployed with a security group created by a separate module, showing how to use multiple modules for modular and scalable Terraform configurations.

---

### **Exercise 9: Clean Up and Destroy All Resources**

1. **Objective**: Use Terraform to destroy all resources created during the exercises.
2. **Instructions**:
   - In the project directory, run the following command to destroy all resources:

     ```bash
     terraform destroy -var-file="dev.tfvars"
     ```

   - Confirm the destroy operation when prompted.

3. **Expected Outcome**:
   - All AWS resources created during the exercises are deleted, demonstrating how to manage infrastructure lifecycle with Terraform.

---
