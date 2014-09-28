---
tags: apis, afnetworking
language: objc
---

# Star Github Repo

## Basic Github Auth

To do most commands with the Github API we need to authorize your iPhone app as if it was logged in with your github account. There a bunch of ways to do this but the easiest is to just set an [Authorization Header](https://developer.github.com/v3/#authentication) to your `AFHTTPOperationManager`. Check out this [Stack Overflow article](http://stackoverflow.com/questions/19102373/afnetworking-2-0-and-http-basic-authentication). It'll be something like this:

```
AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
AFHTTPRequestSerializer *serializer = [[AFHTTPRequestSerializer alloc] init];
[serializer setAuthorizationHeaderFieldWithUsername:GITHUB_ACCESS_TOKEN password:@""];
manager.requestSerializer = serializer;
```

To get your `GITHUB_ACCESS_TOKEN` go to [here](https://github.com/settings/applications) and select Generate New Token. That's your token. 

## Instructions

  1. First create the method in `FISGithubAPIClient` called `checkIfStarred:` that accepts a `full_name` of the repo to check and see if it is currently starred. Checkout the [Github Documentation](https://developer.github.com/v3/activity/starring/#check-if-you-are-starring-a-repository) on how this works on the API side.
  2. Make a method in `FISGithubAPIClient` that stars a repo given its `full_name`. Checkout the [Github Documentation](https://developer.github.com/v3/activity/starring/#star-a-repository)
  3. Make a method in `FISGithubAPIClient` that unstars a repo given its `full_name`. Checkout the [Github Documentation](https://developer.github.com/v3/activity/starring/#unstar-a-repository)
  4. Create a method in `FISReposDataStore` that given a `FISGithubRepository` object, will check to see if it's starred or not and then either star or unstar the repo. In the completionBlock, there should be a `BOOL` parameter called `starred` that is `YES` if the repo was just starred, and `NO` if it was just unstarred.
  5. When a cell is selected, it should call your `FISReposDataStore` method to toggle the starred status and display a `UIAlertView` saying either "You just starred <REPO NAME>" or "You just unstarred <REPO NAME>".


## Extra Credit 

  * Add in the [MBProgressHUD](https://github.com/jdg/MBProgressHUD) cocoapod. Make it show a loading screen when you start the request, and dismiss the loading screen when it's finished loading!
