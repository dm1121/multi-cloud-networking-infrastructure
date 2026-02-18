```text
multi-cloud-networking-infrastructure/
├── README.md
├── LICENSE
├── .gitignore
├── .github/
│   └── workflows/
│       └── terraform.yml           # GitHub Actions (fmt, validate, plan)
├── terraform/
│   ├── providers.tf
│   ├── variables.tf
│   ├── terraform.tfvars.example
│   ├── outputs.tf
│   ├── main.tf                     # optional central entry, or remove if using subdirs only
│   ├── aws/
│   │   ├── vpc.tf
│   │   ├── subnets.tf
│   │   ├── vpn.tf                  # for hub model
│   │   └── outputs.tf
│   ├── azure/
│   │   ├── vnet.tf
│   │   ├── subnets.tf
│   │   ├── vpn.tf
│   │   └── outputs.tf
│   ├── gcp/
│   │   ├── vpc.tf
│   │   ├── subnets.tf
│   │   └── outputs.tf
│   └── modules/                    # reusable later (e.g. vpc-module)
└── docs/
    └── diagrams/
        └── architecture.drawio     # add a simple diagram!
