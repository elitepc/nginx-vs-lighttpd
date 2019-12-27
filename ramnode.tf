# Configure the OpenStack Provider
provider "openstack" {
  user_domain_name = "Default"
  user_name   = "_USERNAME_"
  tenant_id = "_TENANT_ID"
  password    = "_PASSWORD_"
  auth_url    = "https://nyc-controller.ramnode.com:5000/v3"
  region      = "NL"
}
resource "openstack_compute_keypair_v2" "terraform" {
  name       = "terraform"
  public_key = "${file("PUBLIC_KEY.pub")}"
}

# Create a web server
resource "openstack_compute_instance_v2" "test-server" {
  key_pair        = "${openstack_compute_keypair_v2.terraform.name}"
  admin_pass = "_PASSWORD_"
  security_groups = ["firewall"]
   region = "NL"
   name = "attacker1"
   flavor_id = "4f8a20eb-8754-497a-8781-f57c9294a515"
   image_id = "346c4d8b-a907-4dce-af94-6d3a16a6ac98"
  network {
    uuid = "030df88b-38b5-4258-bf7d-68204345ec85"
  }
  network {
    uuid = "c7193a4a-7023-48bb-b6c1-07316d049254"
  }
	user_data = "${file("attack1.sh")}"
}
# Create a web server
resource "openstack_compute_instance_v2" "test-server2" {
  key_pair        = "${openstack_compute_keypair_v2.terraform.name}"
  admin_pass = "_PASSWORD_"
  security_groups = ["firewall"]
   region = "NL"
   name = "attacker11"
   flavor_id = "4f8a20eb-8754-497a-8781-f57c9294a515"
   image_id = "346c4d8b-a907-4dce-af94-6d3a16a6ac98"
  network {
    uuid = "030df88b-38b5-4258-bf7d-68204345ec85"
  }
  network {
    uuid = "c7193a4a-7023-48bb-b6c1-07316d049254"
  }
	user_data = "${file("attack1.sh")}"
}
/*
# Create a web server
resource "openstack_compute_instance_v2" "test-server2" {
  key_pair        = "${openstack_compute_keypair_v2.terraform.name}"
  admin_pass = "_PASSWORD_"
  security_groups = ["firewall"]
   region = "NL"
   name = "attacker2"
   flavor_id = "809e2a6f-786b-4119-8340-485c91c48f2f"
   image_id = "c3cf610c-94dc-4b2d-a97b-1045f064173f"
  network {
    uuid = "030df88b-38b5-4258-bf7d-68204345ec85"
  }
  network {
    uuid = "6166fee0-9b78-420e-b935-2fea8e3e8211"
  }
	user_data = "${file("attack2.sh")}"
}

# Create a web server
resource "openstack_compute_instance_v2" "test-server3" {
  key_pair        = "${openstack_compute_keypair_v2.terraform.name}"
  admin_pass = "_PASSWORD_"
  security_groups = ["firewall"]
   region = "NL"
   name = "attacker3"
   flavor_id = "809e2a6f-786b-4119-8340-485c91c48f2f"
   image_id = "c3cf610c-94dc-4b2d-a97b-1045f064173f"
  network {
    uuid = "030df88b-38b5-4258-bf7d-68204345ec85"
  }
  network {
    uuid = "b10a1f2f-b6f6-4f50-9989-7549681979df"
  }
	user_data = "${file("attack3.sh")}"
}

# Create a web server
resource "openstack_compute_instance_v2" "test-server4" {
  key_pair        = "${openstack_compute_keypair_v2.terraform.name}"
  admin_pass = "_PASSWORD_"
  security_groups = ["firewall"]
   region = "NL"
   name = "attacker4"
   flavor_id = "809e2a6f-786b-4119-8340-485c91c48f2f"
   image_id = "c3cf610c-94dc-4b2d-a97b-1045f064173f"
  network {
    uuid = "030df88b-38b5-4258-bf7d-68204345ec85"
  }
  network {
    uuid = "b7ab7e4b-9fbe-4339-afaa-9b23e5cf3461"
  }
	user_data = "${file("attack4.sh")}"
}
*/