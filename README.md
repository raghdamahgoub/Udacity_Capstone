# Udacity_Capstone

Public GitHub URL 
GitHub URL:https://github.com/Raghda-aws/Udacity_Capstone.git


#Propose and Scope the Project
Capstone Project using Hello World! My Name is Raghda using AWS cloudformation/Circleci/Ansible to copy files to the EC2 instance 
#CircleCI Blue/Green
#PipeLine stages,
1.Linting stage
2.Test installing packages.
3.Scanning the installed packages
4.Deploy Infrastructure-Server
4.Deploy Server using Ansible


PipeLine Workflows
- Linting
      - build-backend
      - test-backend:
          requires: [build-backend]
      - scan-backend:
          requires: [build-backend]
      - deploy-Server-Infrastructure:
          requires: [test-backend,scan-backend]
          filters:
            branches:
              only: [main]
      - deploy-backend:
          requires: [deploy-Server-Infrastructure]
Blue Branch :
1.Deployed Blue VPC-Stack
2.Deployed Blue Server stack
3.Action to be perfromed before merge to allow the blue code to be updated in the Production.
4.Performed change on CircleCI config.yml Templete

In DeployInfra-Server
aws cloudformation create-stack --stack-name capstone-server-blue --template-body --template-file .circleci/files/Server.yml --parameter-overrides EnvironmentName=UdacityProject-blue WebAppServersMinSize=1 WebAppServersMaxSize=4
EnvironmentName=Capstone-server-blue to EnvironmentName=UdacityProject-blue

In Deploying new Network infrastructure
aws cloudformation create-stack --stack-name InfraStack_blue --template-body file://Infrastructure.yml --parameters file://parameters.json
