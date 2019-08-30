
data "google_iam_policy" "admin" {
# create role for compute admin
  binding { # required for google_iam_policy
    role = "roles/compute.admin" 
  
    members = [ 
      "user:tekken7jinkazama09@gmail.com",
    ]
  }
# create role for compute_instance
  binding {
    role = "roles/compute.instanceAdmin" # Permissions to create, modify, 
    # and delete virtual machine instances
    members = [
      "user:tekken7jinkazama09@gmail.com"
    ]
  }

# create role for loadbalancer
  binding {
    role = "roles/compute.loadBalancerAdmin" # Permissions to create, modify, 
    # and delete load balancers and associate resources
    members = [
      "user:tekken7jinkazama09@gmail.com"
    ]
  }

# create role for network
  binding {
    role = "roles/compute.networkAdmin" # Permissions to create, modify, 
# and delete networking resources, except for firewall rules and SSL certificates
    members = [
      "user:tekken7jinkazama09@gmail.com"
    ]
  }
# create role for security policies
    binding {
      role = "roles/compute.orgSecurityPolicyAdmin" # Full control of Compute 
# Engine Organization Security Policies
      members = [
        "user:tekken7jinkazama09@gmail.com"
      ]
    }
# create role for storage admin
    binding {
      role = "roles/compute.storageAdmin"
      members = [
        "user:tekken7jinkazama09@gmail.com"
      ]
    }
# create role for service accounts
    binding {
      role = "roles/iam.serviceAccountAdmin" # Create and manage service accounts.
      members = [
        "user:tekken7jinkazama09@gmail.com"
      ]
    }

# create role for account keys
    binding {
      role = "roles/iam.serviceAccountKeyAdmin" # Create and manage (and rotate) service account keys.
      members = [
        "user:tekken7jinkazama09@gmail.com"
      ]
    }
}
