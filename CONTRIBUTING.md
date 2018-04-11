# Contributing

In this project, we will be using Github to version control our work. Individual developers will fork the main repository into their own repository. To work locally, developers will then clone their forked repository. To upload their work, developers will push changes to their forked repository and send a pull request to at least one other developer for review.

The full instructions can be found from the [Github guides to Forking](https://guides.github.com/activities/forking/).

For individual workflows, developers are permitted to use branching, as described in the [GitFlow guide](https://guides.github.com/introduction/flow/).

### Example of a contributing workflow:

Fork, then clone the repo:

    git clone git@github.com:<your_username>/Insta<Py/R>.git

Make changes, then push the repo:

    git add .
    git commit -m "<[meaningful_commit_message](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)>"
    git push

If the `master` branch is ahead of the forked branch:

    git remote add upstream <original_repo_URL>
    git fetch upstream
    git merge upstream/master

Push to your fork and submit a pull request.

Contributing document derived from [Thoughtbot](https://github.com/thoughtbot/factory_bot_rails/blob/master/CONTRIBUTING.md).
