multi-cloud-networking-infrastructure/
├── README.md
├── LICENSE
├── .gitignore
├── .github/
│   └── workflows/
│       └── terraform.yml          # Optional GitHub Actions for plan/validate
├── terraform/
│   ├── providers.tf               # Provider configurations
│   ├── variables.tf
│   ├── terraform.tfvars.example
│   ├── outputs.tf
│   ├── main.tf                    # Or split into: networking.tf, peering.tf, etc.
│   ├── aws/
│   │   ├── vpc.tf
│   │   ├── subnets.tf
│   │   ├── peering.tf             # (optional - direct peering or transit)
│   │   └── outputs.tf
│   ├── azure/
│   │   ├── vnet.tf
│   │   ├── subnets.tf
│   │   ├── peering.tf
│   │   └── outputs.tf
│   ├── gcp/
│   │   ├── vpc.tf
│   │   ├── subnets.tf
│   │   └── outputs.tf
│   └── modules/                   # (future - reusable modules)
│       └── transit-gateway/       # example placeholder
└── docs/
    └── diagrams/                  # Put draw.io / excalidraw files here
        └── architecture.drawio
