// To parse this JSON data, do
//
//     final issuesModel = issuesModelFromJson(jsonString);

import 'dart:convert';

List<IssuesModel> issuesModelFromJson(String str) => List<IssuesModel>.from(
    json.decode(str).map((x) => IssuesModel.fromJson(x)));

String issuesModelToJson(List<IssuesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IssuesModel {
  IssuesModel({
    required this.url,
    required this.repositoryUrl,
    required this.labelsUrl,
    required this.commentsUrl,
    required this.eventsUrl,
    required this.htmlUrl,
    required this.id,
    required this.nodeId,
    required this.number,
    required this.title,
    required this.user,
    required this.labels,
    required this.state,
    required this.locked,
    required this.assignee,
    required this.assignees,
    required this.milestone,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
    //required this.closedAt,
    required this.authorAssociation,
    //required this.activeLockReason,
    required this.body,
    required this.reactions,
    required this.timelineUrl,
    //required this.performedViaGithubApp,
    //required this.stateReason,
    required this.score,
  });

  final String url;
  final String repositoryUrl;
  final String labelsUrl;
  final String commentsUrl;
  final String eventsUrl;
  final String htmlUrl;
  final int id;
  final String nodeId;
  final int number;
  final String title;
  final IssuesAssignee user;
  final List<Label> labels;
  final String state;
  final bool locked;
  final IssuesAssignee assignee;
  final List<IssuesAssignee> assignees;
  final IssuesMilestone milestone;
  final int comments;
  final DateTime createdAt;
  final DateTime updatedAt;
  //final dynamic closedAt;
  final String authorAssociation;
  //final dynamic activeLockReason;
  final String body;
  final IssuesReactions reactions;
  final String timelineUrl;
  //final dynamic performedViaGithubApp;
  //final dynamic stateReason;
  final int score;

  factory IssuesModel.fromJson(Map<String, dynamic> json) => IssuesModel(
        url: json["url"],
        repositoryUrl: json["repository_url"],
        labelsUrl: json["labels_url"],
        commentsUrl: json["comments_url"],
        eventsUrl: json["events_url"],
        htmlUrl: json["html_url"],
        id: json["id"],
        nodeId: json["node_id"],
        number: json["number"],
        title: json["title"],
        user: IssuesAssignee.fromJson(json["user"]),
        labels: List<Label>.from(json["labels"].map((x) => Label.fromJson(x))),
        state: json["state"],
        locked: json["locked"],
        assignee: IssuesAssignee.fromJson(json["assignee"]),
        assignees: List<IssuesAssignee>.from(
            json["assignees"].map((x) => IssuesAssignee.fromJson(x))),
        milestone: IssuesMilestone.fromJson(json["milestone"]),
        comments: json["comments"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        //closedAt: json["closed_at"],
        authorAssociation: json["author_association"],
        //activeLockReason: json["active_lock_reason"],
        body: json["body"],
        reactions: IssuesReactions.fromJson(json["reactions"]),
        timelineUrl: json["timeline_url"],
        //performedViaGithubApp: json["performed_via_github_app"],
        //stateReason: json["state_reason"],
        score: json["score"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "repository_url": repositoryUrl,
        "labels_url": labelsUrl,
        "comments_url": commentsUrl,
        "events_url": eventsUrl,
        "html_url": htmlUrl,
        "id": id,
        "node_id": nodeId,
        "number": number,
        "title": title,
        "user": user.toJson(),
        "labels": List<dynamic>.from(labels.map((x) => x.toJson())),
        "state": state,
        "locked": locked,
        "assignee": assignee.toJson(),
        "assignees": List<dynamic>.from(assignees.map((x) => x.toJson())),
        "milestone": milestone.toJson(),
        "comments": comments,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        //"closed_at": closedAt,
        "author_association": authorAssociation,
        //"active_lock_reason": activeLockReason,
        "body": body,
        "reactions": reactions.toJson(),
        "timeline_url": timelineUrl,
        //"performed_via_github_app": performedViaGithubApp,
        //"state_reason": stateReason,
        "score": score,
      };
}

class IssuesAssignee {
  IssuesAssignee({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String gravatarId;
  final String url;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String reposUrl;
  final String eventsUrl;
  final String receivedEventsUrl;
  final String type;
  final bool siteAdmin;

  factory IssuesAssignee.fromJson(Map<String, dynamic> json) => IssuesAssignee(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: json["type"],
        siteAdmin: json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "site_admin": siteAdmin,
      };
}

class Label {
  Label({
    required this.id,
    required this.nodeId,
    required this.url,
    required this.name,
    required this.color,
    required this.labelDefault,
    required this.description,
  });

  final int id;
  final String nodeId;
  final String url;
  final String name;
  final String color;
  final bool labelDefault;
  final String description;

  factory Label.fromJson(Map<String, dynamic> json) => Label(
        id: json["id"],
        nodeId: json["node_id"],
        url: json["url"],
        name: json["name"],
        color: json["color"],
        labelDefault: json["default"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "node_id": nodeId,
        "url": url,
        "name": name,
        "color": color,
        "default": labelDefault,
        "description": description,
      };
}

class IssuesMilestone {
  IssuesMilestone({
    required this.url,
    required this.htmlUrl,
    required this.labelsUrl,
    required this.id,
    required this.nodeId,
    required this.number,
    required this.title,
    required this.description,
    required this.creator,
    required this.openIssues,
    required this.closedIssues,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
    //required this.dueOn,
    //required this.closedAt,
  });

  final String url;
  final String htmlUrl;
  final String labelsUrl;
  final int id;
  final String nodeId;
  final int number;
  final String title;
  final String description;
  final IssuesAssignee creator;
  final int openIssues;
  final int closedIssues;
  final String state;
  final DateTime createdAt;
  final DateTime updatedAt;
  //final dynamic dueOn;
  //final dynamic closedAt;

  factory IssuesMilestone.fromJson(Map<String, dynamic> json) =>
      IssuesMilestone(
        url: json["url"],
        htmlUrl: json["html_url"],
        labelsUrl: json["labels_url"],
        id: json["id"],
        nodeId: json["node_id"],
        number: json["number"],
        title: json["title"],
        description: json["description"],
        creator: IssuesAssignee.fromJson(json["creator"]),
        openIssues: json["open_issues"],
        closedIssues: json["closed_issues"],
        state: json["state"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        //dueOn: json["due_on"],
        //closedAt: json["closed_at"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "html_url": htmlUrl,
        "labels_url": labelsUrl,
        "id": id,
        "node_id": nodeId,
        "number": number,
        "title": title,
        "description": description,
        "creator": creator.toJson(),
        "open_issues": openIssues,
        "closed_issues": closedIssues,
        "state": state,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        //"due_on": dueOn,
        //"closed_at": closedAt,
      };
}

class IssuesReactions {
  IssuesReactions({
    required this.url,
    required this.totalCount,
    required this.the1,
    required this.reactions1,
    required this.laugh,
    required this.hooray,
    required this.confused,
    required this.heart,
    required this.rocket,
    required this.eyes,
  });

  final String url;
  final int totalCount;
  final int the1;
  final int reactions1;
  final int laugh;
  final int hooray;
  final int confused;
  final int heart;
  final int rocket;
  final int eyes;

  factory IssuesReactions.fromJson(Map<String, dynamic> json) =>
      IssuesReactions(
        url: json["url"],
        totalCount: json["total_count"],
        the1: json["+1"],
        reactions1: json["-1"],
        laugh: json["laugh"],
        hooray: json["hooray"],
        confused: json["confused"],
        heart: json["heart"],
        rocket: json["rocket"],
        eyes: json["eyes"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "total_count": totalCount,
        "+1": the1,
        "-1": reactions1,
        "laugh": laugh,
        "hooray": hooray,
        "confused": confused,
        "heart": heart,
        "rocket": rocket,
        "eyes": eyes,
      };
}
