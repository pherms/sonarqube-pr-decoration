# Github PR decoration with SonarQube

```yaml
name: Analyze branch and decorate PR
on: workflow_dispatch
jobs:
  build:

    runs-on: ubuntu-latest

    steps:
      # Use an existing action, you can look in the market place to find what you need and how to use it, to setup the sonar scanner
      
      # Another existing action, this one to checkout the repository
      - name: 'Checkout repository on branch: ${{ github.REF }}'
        uses: actions/checkout@v2
        with:
          ref: ${{ github.REF }}
          fetch-depth: 0
      - name: Setup sonar scanner
        uses: pherms/sonarqube-pr-decoration@main
          with:
            host: ${{ secrets.SONARQUBE_HOST }}
            login: ${{ secrets.SONARQUBE_TOKEN }}
            ref: ${{ github.REF }}
            projectKey: "MyProjectKey"
        #uses: warchant/setup-sonar-scanner@v1

```