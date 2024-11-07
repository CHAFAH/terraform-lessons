# Terraform-learning-Zero-to-Hero
Everything Terraform

## What is Terraform
HashiCorp Terraform is an infrastructure as code tool that lets you define both cloud and on-prem resources in human-readable configuration files that you can version, reuse, and share. You can then use a consistent workflow to provision and manage all of your infrastructure throughout its lifecycle. Terraform can manage low-level components like compute, storage, and networking resources, as well as high-level components like DNS entries and SaaS features.

## How does Terraform work?
Terraform creates and manages resources on cloud platforms and other services through their application programming interfaces (APIs). Providers enable Terraform to work with virtually any platform or service with an accessible API.
![Terraform Process](https://developer.hashicorp.com/_next/image?url=https%3A%2F%2Fcontent.hashicorp.com%2Fapi%2Fassets%3Fproduct%3Dterraform%26version%3Drefs%252Fheads%252Fv1.8%26asset%3Dwebsite%252Fimg%252Fdocs%252Fintro-terraform-apis.png%26width%3D2048%26height%3D644&w=3840&q=75)

The core Terraform workflow consists of three stages:

- **Write**: You define resources, which may be across multiple cloud providers and services. For example, you might create a configuration to deploy an application on virtual machines in a Virtual Private Cloud (VPC) network with security groups and a load balancer.

- **Plan**: Terraform creates an execution plan describing the infrastructure it will create, update, or destroy based on the existing infrastructure and your configuration.

- **Apply**: On approval, Terraform performs the proposed operations in the correct order, respecting any resource dependencies. For example, if you update the properties of a VPC and change the number of virtual machines in that VPC, Terraform will recreate the VPC before scaling the virtual machines.

![Terraform Workflow](https://developer.hashicorp.com/_next/image?url=https%3A%2F%2Fcontent.hashicorp.com%2Fapi%2Fassets%3Fproduct%3Dterraform%26version%3Drefs%252Fheads%252Fv1.8%26asset%3Dwebsite%252Fimg%252Fdocs%252Fintro-terraform-workflow.png%26width%3D2038%26height%3D1773&w=3840&q=75)

## Installing Terraform

# Terraform Installation Guide

This guide will walk you through the steps to install Terraform on both Windows and Linux operating systems.

## Installation on Windows

### Prerequisites

1. **Operating System**: Windows 7 or later.
2. **Permissions**: Administrator privileges.

### Steps
1. **Download Terraform**

   Visit the [Terraform download page](https://www.terraform.io/downloads.html) and download the appropriate zip archive for your Windows version.

2. **Extract the Zip Archive**

   Extract the downloaded zip archive to a directory of your choice. For example, `C:\terraform`.

3. **Add Terraform to PATH**

   To use Terraform from any command prompt, you need to add it to your system's PATH.

   1. Open the Start Search, type in "env", and select "Edit the system environment variables".
   2. In the System Properties window, click on the "Environment Variables" button.
   3. In the Environment Variables window, under the "System variables" section, find the "Path" variable and select it. Click the "Edit" button.
   4. In the Edit Environment Variable window, click the "New" button and add the path to the directory where you extracted Terraform. For example, `C:\terraform`.
   5. Click "OK" on all windows to apply the changes.

4. **Verify Installation**

   Open a new command prompt and type `terraform -v` to verify the installation. You should see the installed version of Terraform.

## Installation on Linux

### Prerequisites

1. **Operating System**: Any modern Linux distribution.
2. **Permissions**: Root or sudo privileges.

### Steps

1. **Download Terraform**

   You can use `wget` or `curl` to download the Terraform binary.
   
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

1. **Verify Installation**

   Open a new terminal and type `terraform -v` to verify the installation. You should see the installed version of Terraform.

## Conclusion

You have successfully installed Terraform on your Windows or Linux operating system. You can now proceed to create and manage your infrastructure as code using Terraform. For more information on how to use Terraform, refer to the [official documentation](https://www.terraform.io/docs/index.html).

---
## Terraform providers

HashiCorp and the Terraform community have already written thousands of providers to manage many different types of resources and services. You can find all publicly available providers on the Terraform Registry, including Amazon Web Services (AWS), Azure, Google Cloud Platform (GCP), Kubernetes, Helm, GitHub, Splunk, DataDog, and many more.

To use a provider, you need to configure it in your Terraform configuration file using the provider block. For example, to configure the AWS provider:

```sh

provider "aws" {
  region = "us-west-2"
}

```
---

## Terraform Documentation
The official Terraform documentation is an invaluable resource for learning and reference. It provides comprehensive documentation on all aspects of Terraform, including installation guides, configuration syntax, provider documentation, and best practices.

You can access the Terraform documentation at https://www.terraform.io/docs/.


## Terraform Essential commands
Here are some essential Terraform commands:

- **`terraform init`**: Initializes a Terraform working directory by downloading the necessary provider plugins and setting up the backend configuration.

- **`terraform plan`**: Generates an execution plan that shows what changes Terraform will make to reach the desired state. It provides a summary of resource creations, modifications, or deletions.

- **`terraform apply`**: Applies the changes defined in your Terraform configuration to provision or modify the infrastructure resources. It prompts for confirmation before making any changes.

- **`terraform destroy`**: Destroys all resources managed by Terraform, effectively terminating the provisioned infrastructure.

- **`terraform validate`**: Validates the syntax and configuration of Terraform files, checking for errors and warnings.

- **`terraform state`**: Allows you to manage the Terraform state, including inspecting, modifying, and importing resources into the state.

## Terraform key words

In Terraform, keywords refer to reserved words or identifiers that have special meanings and functionalities within the Terraform configuration language. These keywords are predefined and have specific purposes in defining the infrastructure resources and configurations.

Here are some commonly used keywords in Terraform:

- **`resource`**: Used to define a resource block that represents a specific infrastructure resource to be managed by Terraform. Resources define the type of resource, its configuration, and any dependencies it may have.

- **`provider`**: Specifies a provider block that configures a specific cloud provider or service. The provider block defines the connection details and authentication credentials required to interact with the provider's API.

- **`variable`**: Declares a variable that allows you to parameterize your Terraform configuration and provide custom values during execution. Variables enable flexibility and reusability by allowing you to inject values from external sources or pass them as input when executing Terraform commands.

- **`output`**: Defines an output block that specifies values to be displayed in the output after executing Terraform commands. Outputs can be useful for retrieving information about provisioned resources, such as IP addresses or DNS names.

- **`module`**: Specifies the use of a module in your Terraform configuration. Modules allow you to encapsulate and reuse infrastructure configurations, providing a way to organize and manage complex configurations more effectively.

- **`data`**: Retrieves data from an external source, such as cloud provider APIs or remote state, to be used in your Terraform configuration. Data blocks enable you to query and fetch information about existing resources or retrieve dynamic values for your infrastructure.

- **`locals`**: Defines local variables within your Terraform configuration. Local variables are used for intermediate calculations or to improve readability by storing the results of expressions or complex configurations.

- **`terraform`**: Configures specific settings for Terraform itself. The terraform block allows you to specify the required version of Terraform, backend configurations for state storage, and other global settings.

# Terraform Data types
Terraform supports various data types used in its configuration language. Some common data types include:
- **string**: Represents textual data, such as resource names or configuration values.
- **number**: Represents numeric values, such as port numbers or quantities.
bool: Represents a boolean value (true or false), used for conditional logic.
- **list**: Represents an ordered collection of values of the same type.
- **map**: Represents a set of key-value pairs, where both the keys and values can be of any type.
These data types allow you to define variables, input values, and resource configurations in a structured manner.

# Terraform functions
Terraform provides a rich set of built-in functions that allow you to manipulate and transform data within your configurations. These functions can be used to perform calculations, manipulate strings, iterate over lists, and perform various other operations within your Terraform configurations. Some common functions include:

- **`format`**: Formats a string based on a given format specifier and arguments. 
Example: `format("Hello %s", var.name)`

- **`join`**: Joins a list of strings into a single string using a given separator. 
Example: `join(",", var.names)`

- **`element`**: Retrieves an element from a list or tuple by its index. Example: `element(var.ports, 0)`

- **`lookup`**: Looks up a value in a map based on a specified key. 
Example: `lookup(var.instance_types, var.environment)`

- **`uuid`**: Generates a universally unique identifier (UUID). 
Example: `uuid()`

- **`file`**: Reads the contents of a file and returns it as a string. 
Example: `file("scripts/init.sh")`

- **`max`**: Returns the maximum value from a list of numbers. 
Example: `max(var.sizes)`

- **`min`**: Returns the minimum value from a list of numbers. 
Example: `min(var.sizes)`

- **`length`**: Returns the length of a list, map, or string. 
Example: `length(var.names)`

- **`cidrsubnet`**: Generates a subnet CIDR block based on a given network CIDR block and a subnet index. 
Example: `cidrsubnet(var.network_cidr, 8, var.subnet_index)`

# Managing Secrets with Terraform Vault
- Terraform Vault integration allows you to manage and securely store sensitive information, such as API keys, passwords, and certificates, outside of your Terraform code. Vault is a secrets management solution provided by HashiCorp.

- With Terraform Vault integration, you can retrieve secrets from Vault and use them in your Terraform configurations. This helps to separate sensitive information from your code and follow security best practices.

- To use Terraform Vault integration, you need to configure a Vault provider and specify the secrets you want to retrieve. You can then reference these secrets in your Terraform code as variables.
