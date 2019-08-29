data "google_iam_role" "roleinfo" {
  name = "roles/compute.viewer"
}

data "google_iam_policy" "admin" {
  binding { # required for google_iam_policy
    role = "roles/compute.instanceAdmin" # required for "binding"

    members = [ # required for "binding"
      "user:tekken7jinkazama09@gmail.com",
    ]
  }

  binding {
    role = "roles/storage.objectViewer"

    members = [
      "user:ericallen740@yahoo.com",
    ]
  }

  audit_config { # optional 
    service = "cloudsql.googleapis.com" # required for "audit_config"
    audit_log_configs { # required for "audit_config"
      log_type = "ADMIN_READ", # required for "audit_config"
      exempted_members = ["user:Matt_Shwartz@gmail.com"] # optional for "audit_config"
    }

    audit_log_configs {
      log_type = "DATA_WRITE",
    }

    audit_log_configs {
      log_type = "ADMIN_READ",
    }
  }
}
