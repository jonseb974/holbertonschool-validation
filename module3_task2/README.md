# Module 1: Introduction to DevOps: Automate Everything to
# Focus on What Really Matters

## Learning Objectives

This project aims at practicing with Continuous Integration
(CI) / Delivery (CD) / Deployment to understand the differences,
the goals and the value.

After this project, you should be able to:

Implement Continuous Integration workflows using GitHub Actions
Tell if a given GitHub Action’s workflow is about
Continuous Integration (CI),
or Continuous Delivery (CD)
or Continuous Deployment (skill of context analysis)
Understand the challenges of build reproductibility, through
management of build dependencies using APT packages, NPM, Python3’s pip,
and direct binary downloads.
Build collaboratively a Software Delivery Pipeline and produce released
artifacts, including documenting the changes and the usage
Continuously deploy a static web site to 
[Netlify](https://intranet.hbtn.io/rltoken/mimiujMHFSaj0xxHoDLhSQ).


### Prerequisites


### Concepts

You should have a basic knowledge of the following concepts:
- What is and how to use git tags
- Basics of what is and how to use a GitHub “Release”
- What is and how to create/use a ZIP archive
- Know how to write a valid YAML file


### Make/Makefile usage:

- Executing tasks through make targets
- Default target and PHONY target
- Makefile’s variables and macro syntax

### Tooling
### This project needs the following tools / services:

- [yq](https://mikefarah.gitbook.io/yq/)
- [shellcheck](https://github.com/koalaman/shellcheck)

# How to use the make file:

### Lifecycle

To execute the make file use the following syntax make <command>

```
build:

Builds a new version of the website to folder /dist/
clean:

Removes the contents the folder /dist/
post:

Creates a new post in the contents/post folder with POST_TITLE and POST_NAME
set from the ENV variables.

help:

- Prints out information of the commands to the terminal.
```

### WorkFlow

### About workflows
A workflow is a configurable automated process that will run one or more jobs.
Workflows are defined by a YAML file checked in to your repository and will
run when triggered by an event in your repository, or they can be triggered
manually, or at a defined schedule.

Workflows are defined in the .github/workflows directory in a repository,
and a repository can have multiple workflows, each of which can perform
a different set of tasks. For example, you can have one workflow to build
and test pull requests, another workflow to deploy your application
every time a release is created, and still another workflow that adds
a label every time someone opens a new issue.

### Workflow basics
A workflow must contain the following basic components:

- 1. One or more events that will trigger the workflow.
- 2. One or more jobs, each of which will execute on a runner machine
and run a series of one or more steps.
- 3. Each step can either run a script that you define or run an action,
which is a reusable extension that can simplify your workflow

For more information on these basic components, see
["Understanding GitHub Actions."]
(https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions#the-components-of-github-actions)
![]
(https://docs.github.com/assets/cb-25535/images/help/
images/overview-actions-simple.png)


### Triggering a workflow

Workflow triggers are events that cause a workflow to run. These events can be:

   - Events that occur in your workflow's repository
   - Events that occur outside of GitHub and trigger a repository_dispatch
   event on GitHub
   - Scheduled times
   - Manual

For example, you can configure your workflow to run
when a push is made to the default branch of your repository,
when a release is created, or when an issue is opened.

For more information,
see ["Triggering a workflow"]
(https://docs.github.com/en/actions/using-workflows/triggering-a-workflow),
and for a full list of events,
see ["Events that trigger workflows."]
(https://docs.github.com/en/actions/using-workflows/
events-that-trigger-workflows)

### Workflow syntax
Workflow are defined using YAML.
For the full reference of the YAML syntax for authoring workflows, see
["Workflow syntax for GitHub Actions."]
(https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#about-yaml-syntax-for-workflows)

### Create an example workflow
GitHub Actions uses YAML syntax to define the workflow.
Each workflow is stored as a separate YAML file in your code repository,
in a directory named `.github/workflows.`

You can create an example workflow in your repository that automatically
triggers a series of commands whenever code is pushed.
In this workflow, GitHub Actions checks out the pushed code,
installs the [bats](https://www.npmjs.com/package/bats) testing framework,
and runs a basic command to output the bats version: `bats -v`.
1.  In your repository, create the `.github/workflows/`
directory to store your workflow files.
2.  In the `.github/workflows/` `directory,
create a new file called` `learn-github-actions.yml
and add the following code.`
    ```YAML
    YAML
    name: learn-github-actions
    run-name: ${{ github.actor }} is learning GitHub Actions
    on: [push]
    jobs:
    check-bats-version:
        runs-on: ubuntu-latest
        steps:
        - uses: actions/checkout@v3
        - uses: actions/setup-node@v3
        with:
            node-version: '14'
        - run: npm install -g bats
        - run: bats -v
    ```
3. Commit these changes and push them to your GitHub repository.

Your new GitHub Actions workflow file is now installed in your repository
and will run automatically each time someone pushes a change to the repository.
 To see the details about a workflow's execution history,
 see ["Viewing the activity for a workflow run."]
 (https://docs.github.com/en/actions/using-workflows/
 about-workflows#viewing-the-activity-for-a-workflow-run)

### [Understanding the workflow file]
### (https://docs.github.com/en/actions/
### using-workflows/about-workflows#workflow-syntax)

To help you understand how YAML syntax is used to create a workflow file,
this section explains each line of the introduction's example:

```ruby
   name: learn-github-actions
```
Optional - The name of the workflow as it will
appear in the "Actions" tab of the GitHub repository.

```ruby
   run-name:  ${{ github.actor }} is learning GitHub Actions
```
Optional - The name for workflow runs generated from the workflow,
which will appear in the list of workflow runs on
your repository's "Actions" tab.
This example uses an expression with the github context
to display the username
of the actor that triggered the workflow run.
For more information, see
["Workflow syntax for GitHub Actions."]
(https://docs.github.com/en/actions/
using-workflows/workflow-syntax-for-github-actions#run-name)

### Build Workflow

Now that you have set up your first workflow,
let’s replace the command make help by the command make build.

The result should be a failed pipeline with an error like this one:

As documented by GitHub Actions,
the machines where the workflow’s jobs are run already have
some tools installed.

You can see that some tools required to build our application,
like make or Golang, are available. But others are missing.

There are 2 different strategies to solve this challenge,
each one with its pro and cons:
```
    Install the tools during the build:
        ✅ It ensures that you have an automated and always up-to-date
        installation system
        ❌ but it slows down the builds
        (you have to wait for all tools to be installed while you want
        a feedback as soon as possible)

    Ensure that the workflow is running inside a
    pre-built environment with all the required tools
        ✅ Fast feedback: you don’t need to wait for tools installation
        ❌ Maintenance overhead as you need to manage the pre-built environment
```
For this module, we’ll use the 1st strategy,
and the 2nd will be covered in the “Docker” module.

It should be an easy step:
you already wrote a script setup.sh which role was to
install Hugo in the production environment: let’s reuse this work!

You are expected to create a new workflow named module3_task1
from the previous workflow.

This new workflow should execute the following targets
as distinct steps: build.

Regarding the tooling, you have to:

    Ensure that the workflow is executed into an Ubuntu 18.04
    execution environment
    Ensure that all the required tools are installed prior to any make target,
    by executing the script setup.sh
        ⚠️ The script should be modified to only install missing tools
        (no make target are expected)
## Story

> Continuing your journey as a Software Engineer at Awesome Inc.,
you want to provide early visibility on your work to your colleagues
to allow you to iterate on the most important issues or improvements
for the company.
> By defining a Software Delivery Pipeline with automated tasks,
you’ll ensure that the collaboration between teams is improved,
and that your team grows in maturity while providing an efficient
process to ensure that you can deliver the application often.
