# .gitignore

```
#GoogleService-Info.plist

```

# GoogleService-Info.plist

```plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CLIENT_ID</key>
	<string>522321484-pl4is8a8q61h7nqk53dg4cospc9h9rhl.apps.googleusercontent.com</string>
	<key>REVERSED_CLIENT_ID</key>
	<string>com.googleusercontent.apps.522321484-pl4is8a8q61h7nqk53dg4cospc9h9rhl</string>
	<key>API_KEY</key>
	<string>AIzaSyBgxXbDPMSjRhaJfCPNarGAMypyXkkF_u0</string>
	<key>GCM_SENDER_ID</key>
	<string>522321484</string>
	<key>PLIST_VERSION</key>
	<string>1</string>
	<key>BUNDLE_ID</key>
	<string>com.davidding.Smile</string>
	<key>PROJECT_ID</key>
	<string>smile-caefd</string>
	<key>STORAGE_BUCKET</key>
	<string>smile-caefd.appspot.com</string>
	<key>IS_ADS_ENABLED</key>
	<false/>
	<key>IS_ANALYTICS_ENABLED</key>
	<false/>
	<key>IS_APPINVITE_ENABLED</key>
	<true/>
	<key>IS_GCM_ENABLED</key>
	<true/>
	<key>CFBundleIdentifier</key>
	<string></string>
	<key>IS_SIGNIN_ENABLED</key>
	<true/>
	<key>GOOGLE_APP_ID</key>
	<string>1:522321484:ios:45af3359a9b1685b6cbee9</string>
</dict>
</plist>

```

# Info.plist

```plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict/>
</plist>

```

# package.json

```json
{
  "dependencies": {
    "ai-digest": "^1.0.7"
  }
}

```

# README.md

```md
# Smile
social media app

```

# Smile.xcodeproj/project.pbxproj

```pbxproj
// !$*UTF8*$!
{
	archiveVersion = 1;
	classes = {
	};
	objectVersion = 56;
	objects = {

/* Begin PBXBuildFile section */
		0908AEC42C9B950200F13C0E /* DataService.swift in Sources */ = {isa = PBXBuildFile; fileRef = 0908AEC32C9B950200F13C0E /* DataService.swift */; };
		0908AEC62C9B954C00F13C0E /* FirebaseDataService.swift in Sources */ = {isa = PBXBuildFile; fileRef = 0908AEC52C9B954C00F13C0E /* FirebaseDataService.swift */; };
		0908AEC82C9B965A00F13C0E /* TaggingView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 0908AEC72C9B965A00F13C0E /* TaggingView.swift */; };
		0908AECB2C9B9C8900F13C0E /* FirebaseFirestore in Frameworks */ = {isa = PBXBuildFile; productRef = 0908AECA2C9B9C8900F13C0E /* FirebaseFirestore */; };
		0908AECD2C9B9C9200F13C0E /* FirebaseStorage in Frameworks */ = {isa = PBXBuildFile; productRef = 0908AECC2C9B9C9200F13C0E /* FirebaseStorage */; };
		090F42C42A67A5E90035774E /* SmileApp.swift in Sources */ = {isa = PBXBuildFile; fileRef = 090F42C32A67A5E90035774E /* SmileApp.swift */; };
		090F42C62A67A5E90035774E /* HomeView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 090F42C52A67A5E90035774E /* HomeView.swift */; };
		090F42C82A67A5EA0035774E /* Assets.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = 090F42C72A67A5EA0035774E /* Assets.xcassets */; };
		090F42CB2A67A5EA0035774E /* Preview Assets.xcassets in Resources */ = {isa = PBXBuildFile; fileRef = 090F42CA2A67A5EA0035774E /* Preview Assets.xcassets */; };
		094627E72C50912200C8FE90 /* User.swift in Sources */ = {isa = PBXBuildFile; fileRef = 094627E62C50912200C8FE90 /* User.swift */; };
		094627E92C50913800C8FE90 /* Post.swift in Sources */ = {isa = PBXBuildFile; fileRef = 094627E82C50913800C8FE90 /* Post.swift */; };
		094627ED2C5091B700C8FE90 /* LoginView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 094627EC2C5091B700C8FE90 /* LoginView.swift */; };
		094627F12C5091F600C8FE90 /* UserViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 094627F02C5091F600C8FE90 /* UserViewModel.swift */; };
		094627F52C50920E00C8FE90 /* AuthService.swift in Sources */ = {isa = PBXBuildFile; fileRef = 094627F42C50920E00C8FE90 /* AuthService.swift */; };
		094627F72C50921E00C8FE90 /* NetworkService.swift in Sources */ = {isa = PBXBuildFile; fileRef = 094627F62C50921E00C8FE90 /* NetworkService.swift */; };
		094627F92C50922A00C8FE90 /* Constants.swift in Sources */ = {isa = PBXBuildFile; fileRef = 094627F82C50922A00C8FE90 /* Constants.swift */; };
		094627FB2C50930600C8FE90 /* AuthViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 094627FA2C50930600C8FE90 /* AuthViewModel.swift */; };
		094627FE2C6346A400C8FE90 /* FirebaseAnalytics in Frameworks */ = {isa = PBXBuildFile; productRef = 094627FD2C6346A400C8FE90 /* FirebaseAnalytics */; };
		094628002C6346A400C8FE90 /* FirebaseAuth in Frameworks */ = {isa = PBXBuildFile; productRef = 094627FF2C6346A400C8FE90 /* FirebaseAuth */; };
		0969DF9D2CBDFED7002A7BEA /* HomeViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 0969DF9C2CBDFED3002A7BEA /* HomeViewModel.swift */; };
		0969DF9F2CBDFEEC002A7BEA /* PostView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 0969DF9E2CBDFEE9002A7BEA /* PostView.swift */; };
		0969DFB42CC8803C002A7BEA /* UserPreview.swift in Sources */ = {isa = PBXBuildFile; fileRef = 0969DFB32CC88039002A7BEA /* UserPreview.swift */; };
		0969DFB62CC88096002A7BEA /* TaggingViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 0969DFB52CC88091002A7BEA /* TaggingViewModel.swift */; };
		0969DFBA2CCB4E18002A7BEA /* ImagePicker.swift in Sources */ = {isa = PBXBuildFile; fileRef = 0969DFB92CCB4E13002A7BEA /* ImagePicker.swift */; };
		0969DFBC2CCB50A1002A7BEA /* ProfileImageType.swift in Sources */ = {isa = PBXBuildFile; fileRef = 0969DFBB2CCB509D002A7BEA /* ProfileImageType.swift */; };
		0969DFBE2CCF402F002A7BEA /* ProfileViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 0969DFBD2CCF402B002A7BEA /* ProfileViewModel.swift */; };
		0969DFC22CCF43DA002A7BEA /* TabNavigator.swift in Sources */ = {isa = PBXBuildFile; fileRef = 0969DFC12CCF43D0002A7BEA /* TabNavigator.swift */; };
		0969DFC62CCF4466002A7BEA /* RootView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 0969DFC52CCF4466002A7BEA /* RootView.swift */; };
		0969DFC82CD0406B002A7BEA /* PostDetailView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 0969DFC72CD04060002A7BEA /* PostDetailView.swift */; };
		0969DFCA2CD04087002A7BEA /* PostDetailViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 0969DFC92CD04083002A7BEA /* PostDetailViewModel.swift */; };
		0969DFCC2CD04360002A7BEA /* Comment.swift in Sources */ = {isa = PBXBuildFile; fileRef = 0969DFCB2CD0435C002A7BEA /* Comment.swift */; };
		098AF2A42CA4D9710095B1CD /* GoogleService-Info.plist in Resources */ = {isa = PBXBuildFile; fileRef = 098AF2A32CA4D9710095B1CD /* GoogleService-Info.plist */; };
		099E3F832D18F15600253B08 /* ProfileLoading.swift in Sources */ = {isa = PBXBuildFile; fileRef = 099E3F822D18F15100253B08 /* ProfileLoading.swift */; };
		099E3F852D18F51C00253B08 /* PostsGridView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 099E3F842D18F51C00253B08 /* PostsGridView.swift */; };
		099E3F872D18F52C00253B08 /* SettingsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 099E3F862D18F52C00253B08 /* SettingsView.swift */; };
		09A49D942CE1C3CB00040397 /* UserView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 09A49D932CE1C3CB00040397 /* UserView.swift */; };
		09A49D982CE1C58C00040397 /* PreviewHelpers.swift in Sources */ = {isa = PBXBuildFile; fileRef = 09A49D972CE1C58C00040397 /* PreviewHelpers.swift */; };
		09A49D9C2CE9DD0B00040397 /* Theme.swift in Sources */ = {isa = PBXBuildFile; fileRef = 09A49D9B2CE9DD0600040397 /* Theme.swift */; };
		09A49DA32CED60A900040397 /* PostFeedCell.swift in Sources */ = {isa = PBXBuildFile; fileRef = 09A49DA22CED60A900040397 /* PostFeedCell.swift */; };
		09AAFA432CD5627C004CD75D /* UserTests.swift in Sources */ = {isa = PBXBuildFile; fileRef = 09AAFA422CD5627C004CD75D /* UserTests.swift */; };
		09AAFA472CDC0740004CD75D /* AppState.swift in Sources */ = {isa = PBXBuildFile; fileRef = 09AAFA452CDC073C004CD75D /* AppState.swift */; };
		09AAFA492CDC5055004CD75D /* PostImageView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 09AAFA482CDC5055004CD75D /* PostImageView.swift */; };
		09AAFA4F2CE04EA4004CD75D /* SearchViewModel.swift in Sources */ = {isa = PBXBuildFile; fileRef = 09AAFA4E2CE04EA0004CD75D /* SearchViewModel.swift */; };
		09AAFA512CE0579A004CD75D /* CreateGroupView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 09AAFA502CE0579A004CD75D /* CreateGroupView.swift */; };
		09B1A5502CF02B3800FF3C4B /* DateFormattingHelper.swift in Sources */ = {isa = PBXBuildFile; fileRef = 09B1A54F2CF02B3800FF3C4B /* DateFormattingHelper.swift */; };
		09B1A5522CF02B4C00FF3C4B /* Extensions.swift in Sources */ = {isa = PBXBuildFile; fileRef = 09B1A5512CF02B4300FF3C4B /* Extensions.swift */; };
		09E28BC02A78B11F00C003A1 /* ProfileView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 09E28BBF2A78B11F00C003A1 /* ProfileView.swift */; };
		09E28BC42A78B13700C003A1 /* UploadView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 09E28BC32A78B13700C003A1 /* UploadView.swift */; };
		09E28BC62A78B14A00C003A1 /* GroupsView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 09E28BC52A78B14A00C003A1 /* GroupsView.swift */; };
		09E28BCA2A78B1AD00C003A1 /* SearchView.swift in Sources */ = {isa = PBXBuildFile; fileRef = 09E28BC92A78B1AD00C003A1 /* SearchView.swift */; };
/* End PBXBuildFile section */

/* Begin PBXContainerItemProxy section */
		0969DFA82CBE099C002A7BEA /* PBXContainerItemProxy */ = {
			isa = PBXContainerItemProxy;
			containerPortal = 090F42B82A67A5E90035774E /* Project object */;
			proxyType = 1;
			remoteGlobalIDString = 090F42BF2A67A5E90035774E;
			remoteInfo = Smile;
		};
/* End PBXContainerItemProxy section */

/* Begin PBXFileReference section */
		0908AEC32C9B950200F13C0E /* DataService.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = DataService.swift; sourceTree = "<group>"; };
		0908AEC52C9B954C00F13C0E /* FirebaseDataService.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = FirebaseDataService.swift; sourceTree = "<group>"; };
		0908AEC72C9B965A00F13C0E /* TaggingView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = TaggingView.swift; sourceTree = "<group>"; };
		090F42C02A67A5E90035774E /* Smile.app */ = {isa = PBXFileReference; explicitFileType = wrapper.application; includeInIndex = 0; path = Smile.app; sourceTree = BUILT_PRODUCTS_DIR; };
		090F42C32A67A5E90035774E /* SmileApp.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SmileApp.swift; sourceTree = "<group>"; };
		090F42C52A67A5E90035774E /* HomeView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = HomeView.swift; sourceTree = "<group>"; };
		090F42C72A67A5EA0035774E /* Assets.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = Assets.xcassets; sourceTree = "<group>"; };
		090F42CA2A67A5EA0035774E /* Preview Assets.xcassets */ = {isa = PBXFileReference; lastKnownFileType = folder.assetcatalog; path = "Preview Assets.xcassets"; sourceTree = "<group>"; };
		094627E62C50912200C8FE90 /* User.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = User.swift; sourceTree = "<group>"; };
		094627E82C50913800C8FE90 /* Post.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Post.swift; sourceTree = "<group>"; };
		094627EC2C5091B700C8FE90 /* LoginView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = LoginView.swift; sourceTree = "<group>"; };
		094627F02C5091F600C8FE90 /* UserViewModel.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = UserViewModel.swift; sourceTree = "<group>"; };
		094627F42C50920E00C8FE90 /* AuthService.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AuthService.swift; sourceTree = "<group>"; };
		094627F62C50921E00C8FE90 /* NetworkService.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = NetworkService.swift; sourceTree = "<group>"; };
		094627F82C50922A00C8FE90 /* Constants.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Constants.swift; sourceTree = "<group>"; };
		094627FA2C50930600C8FE90 /* AuthViewModel.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AuthViewModel.swift; sourceTree = "<group>"; };
		0969DF9C2CBDFED3002A7BEA /* HomeViewModel.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = HomeViewModel.swift; sourceTree = "<group>"; };
		0969DF9E2CBDFEE9002A7BEA /* PostView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PostView.swift; sourceTree = "<group>"; };
		0969DFA42CBE099C002A7BEA /* SmileTests.xctest */ = {isa = PBXFileReference; explicitFileType = wrapper.cfbundle; includeInIndex = 0; path = SmileTests.xctest; sourceTree = BUILT_PRODUCTS_DIR; };
		0969DFB22CC4F2D8002A7BEA /* Info.plist */ = {isa = PBXFileReference; lastKnownFileType = text.plist.xml; path = Info.plist; sourceTree = "<group>"; };
		0969DFB32CC88039002A7BEA /* UserPreview.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = UserPreview.swift; sourceTree = "<group>"; };
		0969DFB52CC88091002A7BEA /* TaggingViewModel.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = TaggingViewModel.swift; sourceTree = "<group>"; };
		0969DFB92CCB4E13002A7BEA /* ImagePicker.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ImagePicker.swift; sourceTree = "<group>"; };
		0969DFBB2CCB509D002A7BEA /* ProfileImageType.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ProfileImageType.swift; sourceTree = "<group>"; };
		0969DFBD2CCF402B002A7BEA /* ProfileViewModel.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ProfileViewModel.swift; sourceTree = "<group>"; };
		0969DFC12CCF43D0002A7BEA /* TabNavigator.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = TabNavigator.swift; sourceTree = "<group>"; };
		0969DFC52CCF4466002A7BEA /* RootView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = RootView.swift; sourceTree = "<group>"; };
		0969DFC72CD04060002A7BEA /* PostDetailView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PostDetailView.swift; sourceTree = "<group>"; };
		0969DFC92CD04083002A7BEA /* PostDetailViewModel.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PostDetailViewModel.swift; sourceTree = "<group>"; };
		0969DFCB2CD0435C002A7BEA /* Comment.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Comment.swift; sourceTree = "<group>"; };
		098AF2A32CA4D9710095B1CD /* GoogleService-Info.plist */ = {isa = PBXFileReference; lastKnownFileType = text.plist.xml; path = "GoogleService-Info.plist"; sourceTree = "<group>"; };
		099E3F822D18F15100253B08 /* ProfileLoading.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ProfileLoading.swift; sourceTree = "<group>"; };
		099E3F842D18F51C00253B08 /* PostsGridView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PostsGridView.swift; sourceTree = "<group>"; };
		099E3F862D18F52C00253B08 /* SettingsView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SettingsView.swift; sourceTree = "<group>"; };
		09A49D932CE1C3CB00040397 /* UserView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = UserView.swift; sourceTree = "<group>"; };
		09A49D972CE1C58C00040397 /* PreviewHelpers.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PreviewHelpers.swift; sourceTree = "<group>"; };
		09A49D9B2CE9DD0600040397 /* Theme.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Theme.swift; sourceTree = "<group>"; };
		09A49DA22CED60A900040397 /* PostFeedCell.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PostFeedCell.swift; sourceTree = "<group>"; };
		09AAFA422CD5627C004CD75D /* UserTests.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = UserTests.swift; sourceTree = "<group>"; };
		09AAFA452CDC073C004CD75D /* AppState.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = AppState.swift; sourceTree = "<group>"; };
		09AAFA482CDC5055004CD75D /* PostImageView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = PostImageView.swift; sourceTree = "<group>"; };
		09AAFA4E2CE04EA0004CD75D /* SearchViewModel.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SearchViewModel.swift; sourceTree = "<group>"; };
		09AAFA502CE0579A004CD75D /* CreateGroupView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = CreateGroupView.swift; sourceTree = "<group>"; };
		09B1A54F2CF02B3800FF3C4B /* DateFormattingHelper.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = DateFormattingHelper.swift; sourceTree = "<group>"; };
		09B1A5512CF02B4300FF3C4B /* Extensions.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = Extensions.swift; sourceTree = "<group>"; };
		09E28BBF2A78B11F00C003A1 /* ProfileView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = ProfileView.swift; sourceTree = "<group>"; };
		09E28BC32A78B13700C003A1 /* UploadView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = UploadView.swift; sourceTree = "<group>"; };
		09E28BC52A78B14A00C003A1 /* GroupsView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = GroupsView.swift; sourceTree = "<group>"; };
		09E28BC92A78B1AD00C003A1 /* SearchView.swift */ = {isa = PBXFileReference; lastKnownFileType = sourcecode.swift; path = SearchView.swift; sourceTree = "<group>"; };
/* End PBXFileReference section */

/* Begin PBXFrameworksBuildPhase section */
		090F42BD2A67A5E90035774E /* Frameworks */ = {
			isa = PBXFrameworksBuildPhase;
			buildActionMask = 2147483647;
			files = (
				094627FE2C6346A400C8FE90 /* FirebaseAnalytics in Frameworks */,
				0908AECD2C9B9C9200F13C0E /* FirebaseStorage in Frameworks */,
				094628002C6346A400C8FE90 /* FirebaseAuth in Frameworks */,
				0908AECB2C9B9C8900F13C0E /* FirebaseFirestore in Frameworks */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
		0969DFA12CBE099C002A7BEA /* Frameworks */ = {
			isa = PBXFrameworksBuildPhase;
			buildActionMask = 2147483647;
			files = (
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXFrameworksBuildPhase section */

/* Begin PBXGroup section */
		0908AEC92C9B9C8900F13C0E /* Frameworks */ = {
			isa = PBXGroup;
			children = (
			);
			name = Frameworks;
			sourceTree = "<group>";
		};
		090F42B72A67A5E90035774E = {
			isa = PBXGroup;
			children = (
				098AF2A32CA4D9710095B1CD /* GoogleService-Info.plist */,
				090F42C22A67A5E90035774E /* Smile */,
				09AAFA4B2CDC58B6004CD75D /* SmileTests */,
				090F42C12A67A5E90035774E /* Products */,
				0908AEC92C9B9C8900F13C0E /* Frameworks */,
			);
			sourceTree = "<group>";
		};
		090F42C12A67A5E90035774E /* Products */ = {
			isa = PBXGroup;
			children = (
				090F42C02A67A5E90035774E /* Smile.app */,
				0969DFA42CBE099C002A7BEA /* SmileTests.xctest */,
			);
			name = Products;
			sourceTree = "<group>";
		};
		090F42C22A67A5E90035774E /* Smile */ = {
			isa = PBXGroup;
			children = (
				0969DFB22CC4F2D8002A7BEA /* Info.plist */,
				099E3F812D18F13000253B08 /* Protocols */,
				094627E52C5090E600C8FE90 /* Resources */,
				094627E42C5090DF00C8FE90 /* Utils */,
				094627E32C5090D900C8FE90 /* Services */,
				094627E22C5090D000C8FE90 /* ViewModels */,
				094627E12C5090C800C8FE90 /* Views */,
				09AAFA4A2CDC588D004CD75D /* State */,
				094627E02C5090C200C8FE90 /* Models */,
				090F42C32A67A5E90035774E /* SmileApp.swift */,
				090F42C72A67A5EA0035774E /* Assets.xcassets */,
				090F42C92A67A5EA0035774E /* Preview Content */,
			);
			path = Smile;
			sourceTree = "<group>";
		};
		090F42C92A67A5EA0035774E /* Preview Content */ = {
			isa = PBXGroup;
			children = (
				09A49D972CE1C58C00040397 /* PreviewHelpers.swift */,
				090F42CA2A67A5EA0035774E /* Preview Assets.xcassets */,
			);
			path = "Preview Content";
			sourceTree = "<group>";
		};
		094627E02C5090C200C8FE90 /* Models */ = {
			isa = PBXGroup;
			children = (
				0969DFCB2CD0435C002A7BEA /* Comment.swift */,
				0969DFBB2CCB509D002A7BEA /* ProfileImageType.swift */,
				0969DFB32CC88039002A7BEA /* UserPreview.swift */,
				094627E62C50912200C8FE90 /* User.swift */,
				094627E82C50913800C8FE90 /* Post.swift */,
			);
			path = Models;
			sourceTree = "<group>";
		};
		094627E12C5090C800C8FE90 /* Views */ = {
			isa = PBXGroup;
			children = (
				09A49D9F2CED606700040397 /* Components */,
				09A49D932CE1C3CB00040397 /* UserView.swift */,
				09AAFA502CE0579A004CD75D /* CreateGroupView.swift */,
				0969DFC72CD04060002A7BEA /* PostDetailView.swift */,
				0969DFC52CCF4466002A7BEA /* RootView.swift */,
				0969DFC12CCF43D0002A7BEA /* TabNavigator.swift */,
				0969DFB92CCB4E13002A7BEA /* ImagePicker.swift */,
				0969DF9E2CBDFEE9002A7BEA /* PostView.swift */,
				09E28BBF2A78B11F00C003A1 /* ProfileView.swift */,
				09E28BC92A78B1AD00C003A1 /* SearchView.swift */,
				09E28BC52A78B14A00C003A1 /* GroupsView.swift */,
				09E28BC32A78B13700C003A1 /* UploadView.swift */,
				090F42C52A67A5E90035774E /* HomeView.swift */,
				094627EC2C5091B700C8FE90 /* LoginView.swift */,
				0908AEC72C9B965A00F13C0E /* TaggingView.swift */,
			);
			path = Views;
			sourceTree = "<group>";
		};
		094627E22C5090D000C8FE90 /* ViewModels */ = {
			isa = PBXGroup;
			children = (
				09AAFA4E2CE04EA0004CD75D /* SearchViewModel.swift */,
				0969DFC92CD04083002A7BEA /* PostDetailViewModel.swift */,
				0969DFBD2CCF402B002A7BEA /* ProfileViewModel.swift */,
				0969DFB52CC88091002A7BEA /* TaggingViewModel.swift */,
				0969DF9C2CBDFED3002A7BEA /* HomeViewModel.swift */,
				094627F02C5091F600C8FE90 /* UserViewModel.swift */,
				094627FA2C50930600C8FE90 /* AuthViewModel.swift */,
			);
			path = ViewModels;
			sourceTree = "<group>";
		};
		094627E32C5090D900C8FE90 /* Services */ = {
			isa = PBXGroup;
			children = (
				094627F42C50920E00C8FE90 /* AuthService.swift */,
				094627F62C50921E00C8FE90 /* NetworkService.swift */,
				0908AEC32C9B950200F13C0E /* DataService.swift */,
				0908AEC52C9B954C00F13C0E /* FirebaseDataService.swift */,
			);
			path = Services;
			sourceTree = "<group>";
		};
		094627E42C5090DF00C8FE90 /* Utils */ = {
			isa = PBXGroup;
			children = (
				09B1A5512CF02B4300FF3C4B /* Extensions.swift */,
				09B1A54F2CF02B3800FF3C4B /* DateFormattingHelper.swift */,
				09A49D9B2CE9DD0600040397 /* Theme.swift */,
				094627F82C50922A00C8FE90 /* Constants.swift */,
			);
			path = Utils;
			sourceTree = "<group>";
		};
		094627E52C5090E600C8FE90 /* Resources */ = {
			isa = PBXGroup;
			children = (
			);
			path = Resources;
			sourceTree = "<group>";
		};
		099E3F812D18F13000253B08 /* Protocols */ = {
			isa = PBXGroup;
			children = (
				099E3F822D18F15100253B08 /* ProfileLoading.swift */,
			);
			path = Protocols;
			sourceTree = "<group>";
		};
		09A49D9F2CED606700040397 /* Components */ = {
			isa = PBXGroup;
			children = (
				099E3F862D18F52C00253B08 /* SettingsView.swift */,
				099E3F842D18F51C00253B08 /* PostsGridView.swift */,
				09A49DA22CED60A900040397 /* PostFeedCell.swift */,
				09AAFA482CDC5055004CD75D /* PostImageView.swift */,
			);
			path = Components;
			sourceTree = "<group>";
		};
		09AAFA4A2CDC588D004CD75D /* State */ = {
			isa = PBXGroup;
			children = (
				09AAFA452CDC073C004CD75D /* AppState.swift */,
			);
			path = State;
			sourceTree = "<group>";
		};
		09AAFA4B2CDC58B6004CD75D /* SmileTests */ = {
			isa = PBXGroup;
			children = (
				09AAFA422CD5627C004CD75D /* UserTests.swift */,
			);
			path = SmileTests;
			sourceTree = "<group>";
		};
/* End PBXGroup section */

/* Begin PBXNativeTarget section */
		090F42BF2A67A5E90035774E /* Smile */ = {
			isa = PBXNativeTarget;
			buildConfigurationList = 090F42CE2A67A5EA0035774E /* Build configuration list for PBXNativeTarget "Smile" */;
			buildPhases = (
				090F42BC2A67A5E90035774E /* Sources */,
				090F42BD2A67A5E90035774E /* Frameworks */,
				090F42BE2A67A5E90035774E /* Resources */,
			);
			buildRules = (
			);
			dependencies = (
			);
			name = Smile;
			packageProductDependencies = (
				094627FD2C6346A400C8FE90 /* FirebaseAnalytics */,
				094627FF2C6346A400C8FE90 /* FirebaseAuth */,
				0908AECA2C9B9C8900F13C0E /* FirebaseFirestore */,
				0908AECC2C9B9C9200F13C0E /* FirebaseStorage */,
			);
			productName = Smile;
			productReference = 090F42C02A67A5E90035774E /* Smile.app */;
			productType = "com.apple.product-type.application";
		};
		0969DFA32CBE099C002A7BEA /* SmileTests */ = {
			isa = PBXNativeTarget;
			buildConfigurationList = 0969DFAA2CBE099C002A7BEA /* Build configuration list for PBXNativeTarget "SmileTests" */;
			buildPhases = (
				0969DFA02CBE099C002A7BEA /* Sources */,
				0969DFA12CBE099C002A7BEA /* Frameworks */,
				0969DFA22CBE099C002A7BEA /* Resources */,
			);
			buildRules = (
			);
			dependencies = (
				0969DFA92CBE099C002A7BEA /* PBXTargetDependency */,
			);
			name = SmileTests;
			packageProductDependencies = (
			);
			productName = SmileTests;
			productReference = 0969DFA42CBE099C002A7BEA /* SmileTests.xctest */;
			productType = "com.apple.product-type.bundle.unit-test";
		};
/* End PBXNativeTarget section */

/* Begin PBXProject section */
		090F42B82A67A5E90035774E /* Project object */ = {
			isa = PBXProject;
			attributes = {
				BuildIndependentTargetsInParallel = 1;
				LastSwiftUpdateCheck = 1600;
				LastUpgradeCheck = 1610;
				TargetAttributes = {
					090F42BF2A67A5E90035774E = {
						CreatedOnToolsVersion = 14.3.1;
					};
					0969DFA32CBE099C002A7BEA = {
						CreatedOnToolsVersion = 16.0;
						TestTargetID = 090F42BF2A67A5E90035774E;
					};
				};
			};
			buildConfigurationList = 090F42BB2A67A5E90035774E /* Build configuration list for PBXProject "Smile" */;
			compatibilityVersion = "Xcode 14.0";
			developmentRegion = en;
			hasScannedForEncodings = 0;
			knownRegions = (
				en,
				Base,
			);
			mainGroup = 090F42B72A67A5E90035774E;
			packageReferences = (
				094627FC2C6346A400C8FE90 /* XCRemoteSwiftPackageReference "firebase-ios-sdk" */,
			);
			productRefGroup = 090F42C12A67A5E90035774E /* Products */;
			projectDirPath = "";
			projectRoot = "";
			targets = (
				090F42BF2A67A5E90035774E /* Smile */,
				0969DFA32CBE099C002A7BEA /* SmileTests */,
			);
		};
/* End PBXProject section */

/* Begin PBXResourcesBuildPhase section */
		090F42BE2A67A5E90035774E /* Resources */ = {
			isa = PBXResourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				090F42CB2A67A5EA0035774E /* Preview Assets.xcassets in Resources */,
				090F42C82A67A5EA0035774E /* Assets.xcassets in Resources */,
				098AF2A42CA4D9710095B1CD /* GoogleService-Info.plist in Resources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
		0969DFA22CBE099C002A7BEA /* Resources */ = {
			isa = PBXResourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXResourcesBuildPhase section */

/* Begin PBXSourcesBuildPhase section */
		090F42BC2A67A5E90035774E /* Sources */ = {
			isa = PBXSourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				0908AEC62C9B954C00F13C0E /* FirebaseDataService.swift in Sources */,
				094627F92C50922A00C8FE90 /* Constants.swift in Sources */,
				0969DFBC2CCB50A1002A7BEA /* ProfileImageType.swift in Sources */,
				09E28BC62A78B14A00C003A1 /* GroupsView.swift in Sources */,
				0969DFCC2CD04360002A7BEA /* Comment.swift in Sources */,
				099E3F852D18F51C00253B08 /* PostsGridView.swift in Sources */,
				0969DF9D2CBDFED7002A7BEA /* HomeViewModel.swift in Sources */,
				0969DFB62CC88096002A7BEA /* TaggingViewModel.swift in Sources */,
				09E28BC42A78B13700C003A1 /* UploadView.swift in Sources */,
				09E28BCA2A78B1AD00C003A1 /* SearchView.swift in Sources */,
				094627E72C50912200C8FE90 /* User.swift in Sources */,
				0969DFBE2CCF402F002A7BEA /* ProfileViewModel.swift in Sources */,
				094627FB2C50930600C8FE90 /* AuthViewModel.swift in Sources */,
				09A49D9C2CE9DD0B00040397 /* Theme.swift in Sources */,
				09B1A5502CF02B3800FF3C4B /* DateFormattingHelper.swift in Sources */,
				0969DF9F2CBDFEEC002A7BEA /* PostView.swift in Sources */,
				090F42C62A67A5E90035774E /* HomeView.swift in Sources */,
				0969DFCA2CD04087002A7BEA /* PostDetailViewModel.swift in Sources */,
				099E3F832D18F15600253B08 /* ProfileLoading.swift in Sources */,
				0908AEC42C9B950200F13C0E /* DataService.swift in Sources */,
				099E3F872D18F52C00253B08 /* SettingsView.swift in Sources */,
				09AAFA512CE0579A004CD75D /* CreateGroupView.swift in Sources */,
				0908AEC82C9B965A00F13C0E /* TaggingView.swift in Sources */,
				094627E92C50913800C8FE90 /* Post.swift in Sources */,
				09AAFA4F2CE04EA4004CD75D /* SearchViewModel.swift in Sources */,
				094627F72C50921E00C8FE90 /* NetworkService.swift in Sources */,
				09B1A5522CF02B4C00FF3C4B /* Extensions.swift in Sources */,
				09AAFA492CDC5055004CD75D /* PostImageView.swift in Sources */,
				094627F12C5091F600C8FE90 /* UserViewModel.swift in Sources */,
				09A49D982CE1C58C00040397 /* PreviewHelpers.swift in Sources */,
				0969DFC82CD0406B002A7BEA /* PostDetailView.swift in Sources */,
				09AAFA472CDC0740004CD75D /* AppState.swift in Sources */,
				09A49DA32CED60A900040397 /* PostFeedCell.swift in Sources */,
				0969DFB42CC8803C002A7BEA /* UserPreview.swift in Sources */,
				09A49D942CE1C3CB00040397 /* UserView.swift in Sources */,
				094627ED2C5091B700C8FE90 /* LoginView.swift in Sources */,
				0969DFC22CCF43DA002A7BEA /* TabNavigator.swift in Sources */,
				094627F52C50920E00C8FE90 /* AuthService.swift in Sources */,
				0969DFC62CCF4466002A7BEA /* RootView.swift in Sources */,
				0969DFBA2CCB4E18002A7BEA /* ImagePicker.swift in Sources */,
				09E28BC02A78B11F00C003A1 /* ProfileView.swift in Sources */,
				090F42C42A67A5E90035774E /* SmileApp.swift in Sources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
		0969DFA02CBE099C002A7BEA /* Sources */ = {
			isa = PBXSourcesBuildPhase;
			buildActionMask = 2147483647;
			files = (
				09AAFA432CD5627C004CD75D /* UserTests.swift in Sources */,
			);
			runOnlyForDeploymentPostprocessing = 0;
		};
/* End PBXSourcesBuildPhase section */

/* Begin PBXTargetDependency section */
		0969DFA92CBE099C002A7BEA /* PBXTargetDependency */ = {
			isa = PBXTargetDependency;
			target = 090F42BF2A67A5E90035774E /* Smile */;
			targetProxy = 0969DFA82CBE099C002A7BEA /* PBXContainerItemProxy */;
		};
/* End PBXTargetDependency section */

/* Begin XCBuildConfiguration section */
		090F42CC2A67A5EA0035774E /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ALWAYS_SEARCH_USER_PATHS = NO;
				ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES;
				CLANG_ANALYZER_NONNULL = YES;
				CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
				CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
				CLANG_ENABLE_MODULES = YES;
				CLANG_ENABLE_OBJC_ARC = YES;
				CLANG_ENABLE_OBJC_WEAK = YES;
				CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
				CLANG_WARN_BOOL_CONVERSION = YES;
				CLANG_WARN_COMMA = YES;
				CLANG_WARN_CONSTANT_CONVERSION = YES;
				CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
				CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
				CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
				CLANG_WARN_EMPTY_BODY = YES;
				CLANG_WARN_ENUM_CONVERSION = YES;
				CLANG_WARN_INFINITE_RECURSION = YES;
				CLANG_WARN_INT_CONVERSION = YES;
				CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
				CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
				CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
				CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
				CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER = YES;
				CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
				CLANG_WARN_STRICT_PROTOTYPES = YES;
				CLANG_WARN_SUSPICIOUS_MOVE = YES;
				CLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
				CLANG_WARN_UNREACHABLE_CODE = YES;
				CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
				COPY_PHASE_STRIP = NO;
				DEBUG_INFORMATION_FORMAT = dwarf;
				ENABLE_STRICT_OBJC_MSGSEND = YES;
				ENABLE_TESTABILITY = YES;
				ENABLE_USER_SCRIPT_SANDBOXING = YES;
				GCC_C_LANGUAGE_STANDARD = gnu11;
				GCC_DYNAMIC_NO_PIC = NO;
				GCC_NO_COMMON_BLOCKS = YES;
				GCC_OPTIMIZATION_LEVEL = 0;
				GCC_PREPROCESSOR_DEFINITIONS = (
					"DEBUG=1",
					"$(inherited)",
				);
				GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
				GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
				GCC_WARN_UNDECLARED_SELECTOR = YES;
				GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
				GCC_WARN_UNUSED_FUNCTION = YES;
				GCC_WARN_UNUSED_VARIABLE = YES;
				IPHONEOS_DEPLOYMENT_TARGET = 16.4;
				MTL_ENABLE_DEBUG_INFO = INCLUDE_SOURCE;
				MTL_FAST_MATH = YES;
				ONLY_ACTIVE_ARCH = YES;
				SDKROOT = iphoneos;
				SWIFT_ACTIVE_COMPILATION_CONDITIONS = DEBUG;
				SWIFT_OPTIMIZATION_LEVEL = "-Onone";
			};
			name = Debug;
		};
		090F42CD2A67A5EA0035774E /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ALWAYS_SEARCH_USER_PATHS = NO;
				ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES;
				CLANG_ANALYZER_NONNULL = YES;
				CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
				CLANG_CXX_LANGUAGE_STANDARD = "gnu++20";
				CLANG_ENABLE_MODULES = YES;
				CLANG_ENABLE_OBJC_ARC = YES;
				CLANG_ENABLE_OBJC_WEAK = YES;
				CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
				CLANG_WARN_BOOL_CONVERSION = YES;
				CLANG_WARN_COMMA = YES;
				CLANG_WARN_CONSTANT_CONVERSION = YES;
				CLANG_WARN_DEPRECATED_OBJC_IMPLEMENTATIONS = YES;
				CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
				CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
				CLANG_WARN_EMPTY_BODY = YES;
				CLANG_WARN_ENUM_CONVERSION = YES;
				CLANG_WARN_INFINITE_RECURSION = YES;
				CLANG_WARN_INT_CONVERSION = YES;
				CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
				CLANG_WARN_OBJC_IMPLICIT_RETAIN_SELF = YES;
				CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
				CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
				CLANG_WARN_QUOTED_INCLUDE_IN_FRAMEWORK_HEADER = YES;
				CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
				CLANG_WARN_STRICT_PROTOTYPES = YES;
				CLANG_WARN_SUSPICIOUS_MOVE = YES;
				CLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
				CLANG_WARN_UNREACHABLE_CODE = YES;
				CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
				COPY_PHASE_STRIP = NO;
				DEBUG_INFORMATION_FORMAT = "dwarf-with-dsym";
				ENABLE_NS_ASSERTIONS = NO;
				ENABLE_STRICT_OBJC_MSGSEND = YES;
				ENABLE_USER_SCRIPT_SANDBOXING = YES;
				GCC_C_LANGUAGE_STANDARD = gnu11;
				GCC_NO_COMMON_BLOCKS = YES;
				GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
				GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
				GCC_WARN_UNDECLARED_SELECTOR = YES;
				GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
				GCC_WARN_UNUSED_FUNCTION = YES;
				GCC_WARN_UNUSED_VARIABLE = YES;
				IPHONEOS_DEPLOYMENT_TARGET = 16.4;
				MTL_ENABLE_DEBUG_INFO = NO;
				MTL_FAST_MATH = YES;
				SDKROOT = iphoneos;
				SWIFT_COMPILATION_MODE = wholemodule;
				SWIFT_OPTIMIZATION_LEVEL = "-O";
				VALIDATE_PRODUCT = YES;
			};
			name = Release;
		};
		090F42CF2A67A5EA0035774E /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
				ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
				CODE_SIGN_STYLE = Automatic;
				CURRENT_PROJECT_VERSION = 1;
				DEVELOPMENT_ASSET_PATHS = "\"Smile/Preview Content\"";
				DEVELOPMENT_TEAM = C74JA4P6VX;
				ENABLE_PREVIEWS = YES;
				GENERATE_INFOPLIST_FILE = YES;
				INFOPLIST_FILE = Smile/Info.plist;
				INFOPLIST_KEY_UIApplicationSceneManifest_Generation = YES;
				INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents = YES;
				INFOPLIST_KEY_UILaunchScreen_Generation = YES;
				INFOPLIST_KEY_UISupportedInterfaceOrientations_iPad = "UIInterfaceOrientationPortrait UIInterfaceOrientationPortraitUpsideDown UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight";
				INFOPLIST_KEY_UISupportedInterfaceOrientations_iPhone = "UIInterfaceOrientationPortrait UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight";
				LD_RUNPATH_SEARCH_PATHS = (
					"$(inherited)",
					"@executable_path/Frameworks",
				);
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.davidding.Smile;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_EMIT_LOC_STRINGS = YES;
				SWIFT_VERSION = 5.0;
				TARGETED_DEVICE_FAMILY = "1,2";
			};
			name = Debug;
		};
		090F42D02A67A5EA0035774E /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;
				ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME = AccentColor;
				CODE_SIGN_STYLE = Automatic;
				CURRENT_PROJECT_VERSION = 1;
				DEVELOPMENT_ASSET_PATHS = "\"Smile/Preview Content\"";
				DEVELOPMENT_TEAM = C74JA4P6VX;
				ENABLE_PREVIEWS = YES;
				GENERATE_INFOPLIST_FILE = YES;
				INFOPLIST_FILE = Smile/Info.plist;
				INFOPLIST_KEY_UIApplicationSceneManifest_Generation = YES;
				INFOPLIST_KEY_UIApplicationSupportsIndirectInputEvents = YES;
				INFOPLIST_KEY_UILaunchScreen_Generation = YES;
				INFOPLIST_KEY_UISupportedInterfaceOrientations_iPad = "UIInterfaceOrientationPortrait UIInterfaceOrientationPortraitUpsideDown UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight";
				INFOPLIST_KEY_UISupportedInterfaceOrientations_iPhone = "UIInterfaceOrientationPortrait UIInterfaceOrientationLandscapeLeft UIInterfaceOrientationLandscapeRight";
				LD_RUNPATH_SEARCH_PATHS = (
					"$(inherited)",
					"@executable_path/Frameworks",
				);
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.davidding.Smile;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_EMIT_LOC_STRINGS = YES;
				SWIFT_VERSION = 5.0;
				TARGETED_DEVICE_FAMILY = "1,2";
			};
			name = Release;
		};
		0969DFAB2CBE099C002A7BEA /* Debug */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES;
				BUNDLE_LOADER = "$(TEST_HOST)";
				CODE_SIGN_STYLE = Automatic;
				CURRENT_PROJECT_VERSION = 1;
				DEVELOPMENT_TEAM = C74JA4P6VX;
				GCC_C_LANGUAGE_STANDARD = gnu17;
				GENERATE_INFOPLIST_FILE = YES;
				IPHONEOS_DEPLOYMENT_TARGET = 18.0;
				LOCALIZATION_PREFERS_STRING_CATALOGS = YES;
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.davidding.SmileTests;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_ACTIVE_COMPILATION_CONDITIONS = "DEBUG $(inherited)";
				SWIFT_EMIT_LOC_STRINGS = NO;
				SWIFT_VERSION = 5.0;
				TARGETED_DEVICE_FAMILY = "1,2";
				TEST_HOST = "$(BUILT_PRODUCTS_DIR)/Smile.app/$(BUNDLE_EXECUTABLE_FOLDER_PATH)/Smile";
			};
			name = Debug;
		};
		0969DFAC2CBE099C002A7BEA /* Release */ = {
			isa = XCBuildConfiguration;
			buildSettings = {
				ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS = YES;
				BUNDLE_LOADER = "$(TEST_HOST)";
				CODE_SIGN_STYLE = Automatic;
				CURRENT_PROJECT_VERSION = 1;
				DEVELOPMENT_TEAM = C74JA4P6VX;
				GCC_C_LANGUAGE_STANDARD = gnu17;
				GENERATE_INFOPLIST_FILE = YES;
				IPHONEOS_DEPLOYMENT_TARGET = 18.0;
				LOCALIZATION_PREFERS_STRING_CATALOGS = YES;
				MARKETING_VERSION = 1.0;
				PRODUCT_BUNDLE_IDENTIFIER = com.davidding.SmileTests;
				PRODUCT_NAME = "$(TARGET_NAME)";
				SWIFT_EMIT_LOC_STRINGS = NO;
				SWIFT_VERSION = 5.0;
				TARGETED_DEVICE_FAMILY = "1,2";
				TEST_HOST = "$(BUILT_PRODUCTS_DIR)/Smile.app/$(BUNDLE_EXECUTABLE_FOLDER_PATH)/Smile";
			};
			name = Release;
		};
/* End XCBuildConfiguration section */

/* Begin XCConfigurationList section */
		090F42BB2A67A5E90035774E /* Build configuration list for PBXProject "Smile" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				090F42CC2A67A5EA0035774E /* Debug */,
				090F42CD2A67A5EA0035774E /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
		090F42CE2A67A5EA0035774E /* Build configuration list for PBXNativeTarget "Smile" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				090F42CF2A67A5EA0035774E /* Debug */,
				090F42D02A67A5EA0035774E /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
		0969DFAA2CBE099C002A7BEA /* Build configuration list for PBXNativeTarget "SmileTests" */ = {
			isa = XCConfigurationList;
			buildConfigurations = (
				0969DFAB2CBE099C002A7BEA /* Debug */,
				0969DFAC2CBE099C002A7BEA /* Release */,
			);
			defaultConfigurationIsVisible = 0;
			defaultConfigurationName = Release;
		};
/* End XCConfigurationList section */

/* Begin XCRemoteSwiftPackageReference section */
		094627FC2C6346A400C8FE90 /* XCRemoteSwiftPackageReference "firebase-ios-sdk" */ = {
			isa = XCRemoteSwiftPackageReference;
			repositoryURL = "https://github.com/firebase/firebase-ios-sdk.git";
			requirement = {
				kind = upToNextMajorVersion;
				minimumVersion = 11.0.0;
			};
		};
/* End XCRemoteSwiftPackageReference section */

/* Begin XCSwiftPackageProductDependency section */
		0908AECA2C9B9C8900F13C0E /* FirebaseFirestore */ = {
			isa = XCSwiftPackageProductDependency;
			package = 094627FC2C6346A400C8FE90 /* XCRemoteSwiftPackageReference "firebase-ios-sdk" */;
			productName = FirebaseFirestore;
		};
		0908AECC2C9B9C9200F13C0E /* FirebaseStorage */ = {
			isa = XCSwiftPackageProductDependency;
			package = 094627FC2C6346A400C8FE90 /* XCRemoteSwiftPackageReference "firebase-ios-sdk" */;
			productName = FirebaseStorage;
		};
		094627FD2C6346A400C8FE90 /* FirebaseAnalytics */ = {
			isa = XCSwiftPackageProductDependency;
			package = 094627FC2C6346A400C8FE90 /* XCRemoteSwiftPackageReference "firebase-ios-sdk" */;
			productName = FirebaseAnalytics;
		};
		094627FF2C6346A400C8FE90 /* FirebaseAuth */ = {
			isa = XCSwiftPackageProductDependency;
			package = 094627FC2C6346A400C8FE90 /* XCRemoteSwiftPackageReference "firebase-ios-sdk" */;
			productName = FirebaseAuth;
		};
/* End XCSwiftPackageProductDependency section */
	};
	rootObject = 090F42B82A67A5E90035774E /* Project object */;
}

```

# Smile.xcodeproj/project.xcworkspace/contents.xcworkspacedata

```xcworkspacedata
<?xml version="1.0" encoding="UTF-8"?>
<Workspace
   version = "1.0">
   <FileRef
      location = "self:">
   </FileRef>
</Workspace>

```

# Smile.xcodeproj/project.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist

```plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>IDEDidComputeMac32BitWarning</key>
	<true/>
</dict>
</plist>

```

# Smile.xcodeproj/project.xcworkspace/xcshareddata/swiftpm/Package.resolved

```resolved
{
  "originHash" : "a1569f9895aa2be8e24832f98525d5da4eb90b5d158a82691c15b47eb72a13d7",
  "pins" : [
    {
      "identity" : "abseil-cpp-binary",
      "kind" : "remoteSourceControl",
      "location" : "https://github.com/google/abseil-cpp-binary.git",
      "state" : {
        "revision" : "194a6706acbd25e4ef639bcaddea16e8758a3e27",
        "version" : "1.2024011602.0"
      }
    },
    {
      "identity" : "app-check",
      "kind" : "remoteSourceControl",
      "location" : "https://github.com/google/app-check.git",
      "state" : {
        "revision" : "21fe1af9be463a359aaf8d96789ef73fc3760d09",
        "version" : "11.0.1"
      }
    },
    {
      "identity" : "firebase-ios-sdk",
      "kind" : "remoteSourceControl",
      "location" : "https://github.com/firebase/firebase-ios-sdk.git",
      "state" : {
        "revision" : "1fc52ab0e172e7c5a961f975a76c2611f4f22852",
        "version" : "11.2.0"
      }
    },
    {
      "identity" : "googleappmeasurement",
      "kind" : "remoteSourceControl",
      "location" : "https://github.com/google/GoogleAppMeasurement.git",
      "state" : {
        "revision" : "07a2f57d147d2bf368a0d2dcb5579ff082d9e44f",
        "version" : "11.1.0"
      }
    },
    {
      "identity" : "googledatatransport",
      "kind" : "remoteSourceControl",
      "location" : "https://github.com/google/GoogleDataTransport.git",
      "state" : {
        "revision" : "617af071af9aa1d6a091d59a202910ac482128f9",
        "version" : "10.1.0"
      }
    },
    {
      "identity" : "googleutilities",
      "kind" : "remoteSourceControl",
      "location" : "https://github.com/google/GoogleUtilities.git",
      "state" : {
        "revision" : "53156c7ec267db846e6b64c9f4c4e31ba4cf75eb",
        "version" : "8.0.2"
      }
    },
    {
      "identity" : "grpc-binary",
      "kind" : "remoteSourceControl",
      "location" : "https://github.com/google/grpc-binary.git",
      "state" : {
        "revision" : "f56d8fc3162de9a498377c7b6cea43431f4f5083",
        "version" : "1.65.1"
      }
    },
    {
      "identity" : "gtm-session-fetcher",
      "kind" : "remoteSourceControl",
      "location" : "https://github.com/google/gtm-session-fetcher.git",
      "state" : {
        "revision" : "a2ab612cb980066ee56d90d60d8462992c07f24b",
        "version" : "3.5.0"
      }
    },
    {
      "identity" : "interop-ios-for-google-sdks",
      "kind" : "remoteSourceControl",
      "location" : "https://github.com/google/interop-ios-for-google-sdks.git",
      "state" : {
        "revision" : "2d12673670417654f08f5f90fdd62926dc3a2648",
        "version" : "100.0.0"
      }
    },
    {
      "identity" : "leveldb",
      "kind" : "remoteSourceControl",
      "location" : "https://github.com/firebase/leveldb.git",
      "state" : {
        "revision" : "a0bc79961d7be727d258d33d5a6b2f1023270ba1",
        "version" : "1.22.5"
      }
    },
    {
      "identity" : "nanopb",
      "kind" : "remoteSourceControl",
      "location" : "https://github.com/firebase/nanopb.git",
      "state" : {
        "revision" : "b7e1104502eca3a213b46303391ca4d3bc8ddec1",
        "version" : "2.30910.0"
      }
    },
    {
      "identity" : "promises",
      "kind" : "remoteSourceControl",
      "location" : "https://github.com/google/promises.git",
      "state" : {
        "revision" : "540318ecedd63d883069ae7f1ed811a2df00b6ac",
        "version" : "2.4.0"
      }
    },
    {
      "identity" : "swift-protobuf",
      "kind" : "remoteSourceControl",
      "location" : "https://github.com/apple/swift-protobuf.git",
      "state" : {
        "revision" : "edb6ed4919f7756157fe02f2552b7e3850a538e5",
        "version" : "1.28.1"
      }
    }
  ],
  "version" : 3
}

```

# Smile.xcodeproj/project.xcworkspace/xcuserdata/davidding.xcuserdatad/UserInterfaceState.xcuserstate

This is a binary file of the type: Binary

# Smile.xcodeproj/xcuserdata/davidding.xcuserdatad/xcdebugger/Breakpoints_v2.xcbkptlist

```xcbkptlist
<?xml version="1.0" encoding="UTF-8"?>
<Bucket
   uuid = "5BE72DF1-FC95-4991-9384-FEC25CC4BC57"
   type = "1"
   version = "2.0">
   <Breakpoints>
      <BreakpointProxy
         BreakpointExtensionID = "Xcode.Breakpoint.FileBreakpoint">
         <BreakpointContent
            uuid = "03A4685E-C391-4A5C-B1B8-BD4ECE94C095"
            shouldBeEnabled = "No"
            ignoreCount = "0"
            continueAfterRunningActions = "No"
            filePath = "Smile/State/AppState.swift"
            startingColumnNumber = "9223372036854775807"
            endingColumnNumber = "9223372036854775807"
            startingLineNumber = "23"
            endingLineNumber = "23"
            landmarkName = "refreshAllPosts()"
            landmarkType = "7">
         </BreakpointContent>
      </BreakpointProxy>
      <BreakpointProxy
         BreakpointExtensionID = "Xcode.Breakpoint.FileBreakpoint">
         <BreakpointContent
            uuid = "217F86C2-DF99-464A-A697-8AEB6AF82233"
            shouldBeEnabled = "No"
            ignoreCount = "0"
            continueAfterRunningActions = "No"
            filePath = "Smile/State/AppState.swift"
            startingColumnNumber = "9223372036854775807"
            endingColumnNumber = "9223372036854775807"
            startingLineNumber = "21"
            endingLineNumber = "21"
            landmarkName = "init(dataService:)"
            landmarkType = "7">
         </BreakpointContent>
      </BreakpointProxy>
   </Breakpoints>
</Bucket>

```

# Smile.xcodeproj/xcuserdata/davidding.xcuserdatad/xcschemes/xcschememanagement.plist

```plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>SchemeUserState</key>
	<dict>
		<key>Promises (Playground) 1.xcscheme</key>
		<dict>
			<key>isShown</key>
			<false/>
			<key>orderHint</key>
			<integer>2</integer>
		</dict>
		<key>Promises (Playground) 2.xcscheme</key>
		<dict>
			<key>isShown</key>
			<false/>
			<key>orderHint</key>
			<integer>3</integer>
		</dict>
		<key>Promises (Playground).xcscheme</key>
		<dict>
			<key>isShown</key>
			<false/>
			<key>orderHint</key>
			<integer>0</integer>
		</dict>
		<key>Smile.xcscheme_^#shared#^_</key>
		<dict>
			<key>orderHint</key>
			<integer>0</integer>
		</dict>
	</dict>
</dict>
</plist>

```

# Smile/App.swift

```swift
//
//  App.swift
//  Smile
//
//  Created by David Ding on 10/27/24.
//

import SwiftUI

struct App: View {
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some View {
        Group {
            if authViewModel.isAuthenticated {
                TabNavigator()
            } else {
                LoginView()
            }
        }
        .environmentObject(authViewModel)
    }
}


struct App_Previews: PreviewProvider {
    static var previews: some View {
        App()
            .environmentObject(AuthViewModel())
    }
}

```

# Smile/Assets.xcassets/AccentColor.colorset/Contents.json

```json
{
  "colors" : [
    {
      "idiom" : "universal"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}

```

# Smile/Assets.xcassets/AppBackground.colorset/Contents.json

```json
{
  "colors" : [
    {
      "color" : {
        "color-space" : "srgb",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0xF7",
          "green" : "0xF2",
          "red" : "0xF2"
        }
      },
      "idiom" : "universal"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "srgb",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0x00",
          "green" : "0x00",
          "red" : "0x00"
        }
      },
      "idiom" : "universal"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}

```

# Smile/Assets.xcassets/AppIcon.appiconset/Contents.json

```json
{
  "images" : [
    {
      "filename" : "Untitled_Artwork.png",
      "idiom" : "universal",
      "platform" : "ios",
      "size" : "1024x1024"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}

```

# Smile/Assets.xcassets/AppIcon.appiconset/Untitled_Artwork.png

This is a binary file of the type: Image

# Smile/Assets.xcassets/AppSurface.colorset/Contents.json

```json
{
  "colors" : [
    {
      "color" : {
        "color-space" : "srgb",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0xFF",
          "green" : "0xFF",
          "red" : "0xFF"
        }
      },
      "idiom" : "universal"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "srgb",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0x1E",
          "green" : "0x1C",
          "red" : "0x1C"
        }
      },
      "idiom" : "universal"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}

```

# Smile/Assets.xcassets/bannerImage.imageset/codioful-formerly-gradienta-LeG68PrXA6Y-unsplash.jpg

This is a binary file of the type: Image

# Smile/Assets.xcassets/bannerImage.imageset/Contents.json

```json
{
  "images" : [
    {
      "idiom" : "universal",
      "scale" : "1x"
    },
    {
      "filename" : "codioful-formerly-gradienta-LeG68PrXA6Y-unsplash.jpg",
      "idiom" : "universal",
      "scale" : "2x"
    },
    {
      "idiom" : "universal",
      "scale" : "3x"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}

```

# Smile/Assets.xcassets/BrandPrimary.colorset/Contents.json

```json
{
  "colors" : [
    {
      "color" : {
        "color-space" : "srgb",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0x00",
          "green" : "0xD9",
          "red" : "0xFF"
        }
      },
      "idiom" : "universal"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "srgb",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0x57",
          "green" : "0xE6",
          "red" : "0xFF"
        }
      },
      "idiom" : "universal"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}

```

# Smile/Assets.xcassets/BrandSecondary.colorset/Contents.json

```json
{
  "colors" : [
    {
      "color" : {
        "color-space" : "srgb",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0x6C",
          "green" : "0xD8",
          "red" : "0x78"
        }
      },
      "idiom" : "universal"
    },
    {
      "appearances" : [
        {
          "appearance" : "luminosity",
          "value" : "dark"
        }
      ],
      "color" : {
        "color-space" : "srgb",
        "components" : {
          "alpha" : "1.000",
          "blue" : "0x86",
          "green" : "0xE8",
          "red" : "0x90"
        }
      },
      "idiom" : "universal"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}

```

# Smile/Assets.xcassets/Contents.json

```json
{
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}

```

# Smile/Assets.xcassets/defaultAvatar.imageset/Contents.json

```json
{
  "images" : [
    {
      "idiom" : "universal",
      "scale" : "1x"
    },
    {
      "filename" : "Untitled_Artwork.png",
      "idiom" : "universal",
      "scale" : "2x"
    },
    {
      "idiom" : "universal",
      "scale" : "3x"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}

```

# Smile/Assets.xcassets/defaultAvatar.imageset/Untitled_Artwork.png

This is a binary file of the type: Image

# Smile/Info.plist

```plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict/>
</plist>

```

# Smile/Models/Comment.swift

```swift
//
//  Untitled.swift
//  Smile
//
//  Created by David Ding on 10/28/24.
//

import Foundation
import FirebaseFirestore

struct Comment: Identifiable, Codable {
    @DocumentID var id: String?
    let userId: String
    let username: String
    let text: String
    @ServerTimestamp var createdAt: Date?
    
    var timeAgo: String {
        guard let date = createdAt else { return "" }
        // Simple time ago string
        let seconds = -Int(date.timeIntervalSinceNow)
        if seconds < 60 {
            return "just now"
        } else if seconds < 3600 {
            let minutes = seconds / 60
            return "\(minutes)m"
        } else if seconds < 86400 {
            let hours = seconds / 3600
            return "\(hours)h"
        } else {
            let days = seconds / 86400
            return "\(days)d"
        }
    }
}

struct LikeStatus {
    let isLiked: Bool
    let count: Int
}

```

# Smile/Models/Post.swift

```swift
//
//  Post.swift
//  Smile
//
//  Created by David Ding on 7/23/24.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage

struct Post: Identifiable, Codable {
    @DocumentID var id: String?
    let userId: String
    let username: String
    let imagePath: String
    let caption: String
    let taggedUsers: [String]
    @ServerTimestamp var createdAt: Date?
    let likeCount: Int
    let commentCount: Int
    
    var uniqueId: String {
        id ?? "\(userId)-\(createdAt?.timeIntervalSince1970 ?? 0)"
    }
    
    // Default memberwise initializer for creating posts
    init(
        id: String? = nil,
        userId: String,
        username: String,
        imagePath: String,
        caption: String,
        taggedUsers: [String] = [],
        createdAt: Date? = nil,
        likeCount: Int = 0,
        commentCount: Int = 0
    ) {
        self.id = id
        self.userId = userId
        self.username = username
        self.imagePath = imagePath
        self.caption = caption
        self.taggedUsers = taggedUsers
        self.createdAt = createdAt
        self.likeCount = likeCount
        self.commentCount = commentCount
    }
}

// Separate extension for Codable implementation
extension Post {
    enum CodingKeys: String, CodingKey {
        case id, userId, username, imagePath, caption, taggedUsers, createdAt, likeCount, commentCount
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.username = try container.decode(String.self, forKey: .username)
        self.imagePath = try container.decode(String.self, forKey: .imagePath)
        self.caption = try container.decode(String.self, forKey: .caption)
        self.taggedUsers = try container.decode([String].self, forKey: .taggedUsers)
        self.createdAt = try container.decodeIfPresent(Date.self, forKey: .createdAt)
        self.likeCount = try container.decodeIfPresent(Int.self, forKey: .likeCount) ?? 0
        self.commentCount = try container.decodeIfPresent(Int.self, forKey: .commentCount) ?? 0
    }
}

// Separate helper struct for image handling
struct PostImage {
    enum PostImageError: Error {
        case invalidPath
        case downloadFailed(Error)
        
        var localizedDescription: String {
            switch self {
            case .invalidPath:
                return "Invalid image path"
            case .downloadFailed(let error):
                return "Failed to download image: \(error.localizedDescription)"
            }
        }
    }
    
    static func getURL(for path: String) async throws -> URL {
        // If the path is already a full URL string, try to use it directly
        if let url = URL(string: path), url.scheme != nil {
            return url
        }
        
        guard !path.isEmpty else {
            throw PostImageError.invalidPath
        }
        
        do {
            let storageRef = Storage.storage().reference().child(path)
            return try await storageRef.downloadURL()
        } catch {
            throw PostImageError.downloadFailed(error)
        }
    }
}

```

# Smile/Models/ProfileImageType.swift

```swift
//
//  ProfileImageType.swift
//  Smile
//
//  Created by David Ding on 10/24/24.
//

enum ProfileImageType {
    case profilePicture
    case bannerPicture
}

```

# Smile/Models/User.swift

```swift
//
//  User.swift
//  Smile
//
//  Created by David Ding on 7/23/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let email: String
    private var _username: String
    let firstName: String
    let lastName: String
    var profilePictureUrl: String?
    var bannerPictureUrl: String?
    
    var username: String {
        get { _username.lowercased() }
        set { _username = newValue.lowercased() }
    }
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case _username = "username"
        case firstName
        case lastName
        case profilePictureUrl
        case bannerPictureUrl
    }
    
    // Add custom init to handle the username property
    init(id: String, email: String, username: String, firstName: String, lastName: String, profilePictureUrl: String? = nil, bannerPictureUrl: String? = nil) {
        self.id = id
        self.email = email
        self._username = username.lowercased()
        self.firstName = firstName
        self.lastName = lastName
        self.profilePictureUrl = profilePictureUrl
        self.bannerPictureUrl = bannerPictureUrl
    }
}

```

# Smile/Models/UserPreview.swift

```swift
//
//  UserPreview.swift
//  Smile
//
//  Created by David Ding on 10/22/24.
//
import Foundation

// In UserPreview.swift
struct UserPreview: Identifiable, Hashable {
    let id: String
    let username: String
    let profilePictureUrl: String?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: UserPreview, rhs: UserPreview) -> Bool {
        lhs.id == rhs.id
    }
}

```

# Smile/Preview Content/Preview Assets.xcassets/Contents.json

```json
{
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}

```

# Smile/Preview Content/PreviewHelpers.swift

```swift
//
//  PreviewHelpers.swift
//  Smile
//
//  Created by David Ding on 11/10/24.
//
import SwiftUI

struct PreviewHelpers {
    // MARK: - Users
    static let demoUser = User(
        id: "demo-user-id",
        email: "demo@example.com",
        username: "demouser",
        firstName: "Alex",
        lastName: "Rivers",
        profilePictureUrl: "https://picsum.photos/200",
        bannerPictureUrl: "https://picsum.photos/800/400"
    )
    
    static let sampleUsers = [
        demoUser,
        User(
            id: "user-2",
            email: "sarah@example.com",
            username: "sarahsmith",
            firstName: "Sarah",
            lastName: "Smith",
            profilePictureUrl: "https://picsum.photos/201",
            bannerPictureUrl: "https://picsum.photos/800/401"
        ),
        User(
            id: "user-3",
            email: "mike@example.com",
            username: "mikechen",
            firstName: "Mike",
            lastName: "Chen",
            profilePictureUrl: "https://picsum.photos/202",
            bannerPictureUrl: "https://picsum.photos/800/402"
        )
    ]
    
    // MARK: - Posts
    static let samplePosts = [
        Post(
            userId: demoUser.id,
            username: demoUser.username,
            imagePath: "path/to/image1.jpg",
            caption: "Beautiful sunset at the beach! #nature #peace",
            taggedUsers: ["sarahsmith"],
            createdAt: Date().addingTimeInterval(-3600),
            likeCount: 42,
            commentCount: 7
        ),
        Post(
            userId: demoUser.id,
            username: demoUser.username,
            imagePath: "path/to/image2.jpg",
            caption: "Coffee time with friends ☕️ #coffeelover",
            taggedUsers: ["mikechen", "sarahsmith"],
            createdAt: Date().addingTimeInterval(-7200),
            likeCount: 89,
            commentCount: 12
        )
    ]
    
    // MARK: - Comments
    static let sampleComments = [
        Comment(
            userId: "user-2",
            username: "sarahsmith",
            text: "This looks amazing! "
        ),
        Comment(
            userId: "user-3",
            username: "mikechen",
            text: "Great shot!"
        )
    ]
    
    // MARK: - View Models
    static let mockAuthViewModel: AuthViewModel = {
        let viewModel = AuthViewModel()
        viewModel.currentUser = demoUser
        return viewModel
    }()
    
    @MainActor static func mockProfileViewModel() -> ProfileViewModel {
        ProfileViewModel(authViewModel: mockAuthViewModel)
    }
}

// MARK: - Preview Container Views
extension PreviewHelpers {
    /// A container view that provides common environment objects for previews
    struct PreviewContainer<Content: View>: View {
        let content: Content
        
        init(@ViewBuilder content: () -> Content) {
            self.content = content()
        }
        
        var body: some View {
            content
                .environmentObject(mockAuthViewModel)
        }
    }
}

// MARK: - Example TabView Preview
struct TabViewPreview_Previews: PreviewProvider {
    static var previews: some View {
        PreviewHelpers.PreviewContainer {
            TabView {
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
                
                UserView(userId: PreviewHelpers.sampleUsers[1].id)
                    .tabItem {
                        Label("User", systemImage: "person.2")
                    }
            }
        }
    }
}

```

# Smile/Protocols/ProfileLoading.swift

```swift
//
//  ProfileLoading.swift
//  Smile
//
//  Created by David Ding on 12/22/24.
//
import SwiftUI
import Combine

@MainActor
protocol ProfileLoading: ObservableObject {
    var user: User? { get set }
    var uploadedPosts: [Post] { get set }
    var taggedPosts: [Post] { get set }
    var isLoading: Bool { get set }
    var error: String? { get set }
    
    var dataService: DataService { get }
    var userId: String { get }
    
    func loadProfile() async
    func loadUserPosts() async
}

@MainActor
extension ProfileLoading {
    func loadProfile() async {  // Added async keyword
        isLoading = true
        
        do {
            user = try await dataService.fetchUserProfile(userId: userId)
            await loadUserPosts()
        } catch {
            self.error = error.localizedDescription
        }
        isLoading = false
    }

    func loadUserPosts() async {
        do {
            let uploaded = try await dataService.fetchUserPosts(userId: userId, limit: 12, after: nil)
            uploadedPosts = uploaded
            
            let tagged = try await dataService.fetchTaggedPosts(userId: userId, limit: 12, after: nil)
            taggedPosts = tagged
        } catch {
            self.error = error.localizedDescription
        }
    }
}

```

# Smile/Services/AuthService.swift

```swift
//
//  AuthService.swift
//  Smile
//
//  Created by David Ding on 7/23/24.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore

enum AuthError: Error {
    case signUpFailed(String)
    case signInFailed(String)
    case signOutFailed(String)
}

class AuthService: ObservableObject {
    @Published var currentUser: User?
    
    private var authStateDidChangeListenerHandle: AuthStateDidChangeListenerHandle?
    
    init() {
        authStateDidChangeListenerHandle = Auth.auth().addStateDidChangeListener { [weak self] (_, firebaseUser) in
            if let firebaseUser = firebaseUser {
                // Fetch additional user data from Firestore
                let db = Firestore.firestore()
                db.collection("users").document(firebaseUser.uid).getDocument { (document, error) in
                    if let document = document, let data = document.data() {
                        self?.currentUser = User(
                            id: firebaseUser.uid,
                            email: firebaseUser.email ?? "",
                            username: firebaseUser.displayName ?? "",
                            firstName: data["firstName"] as? String ?? "",
                            lastName: data["lastName"] as? String ?? ""
                        )
                    }
                }
            } else {
                self?.currentUser = nil
            }
        }
    }
    
    deinit {
        if let handle = authStateDidChangeListenerHandle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    func signUp(email: String, password: String, username: String, firstName: String, lastName: String) -> AnyPublisher<User, AuthError> {
        return Future { promise in
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if let error = error {
                    promise(.failure(.signUpFailed(error.localizedDescription)))
                    return
                }
                
                guard let authResult = authResult else {
                    promise(.failure(.signUpFailed("Unknown error occurred")))
                    return
                }
                
                let changeRequest = authResult.user.createProfileChangeRequest()
                changeRequest.displayName = username
                changeRequest.commitChanges { (error) in
                    if let error = error {
                        promise(.failure(.signUpFailed(error.localizedDescription)))
                        return
                    }
                    
                    // Create user document in Firestore
                    let db = Firestore.firestore()
                    let userData: [String: Any] = [
                        "username": username,
                        "email": email,
                        "firstName": firstName,
                        "lastName": lastName,
                        "createdAt": FieldValue.serverTimestamp()
                    ]
                    
                    db.collection("users").document(authResult.user.uid).setData(userData) { error in
                        if let error = error {
                            promise(.failure(.signUpFailed(error.localizedDescription)))
                            return
                        }
                        
                        let user = User(
                            id: authResult.user.uid,
                            email: email,
                            username: username,
                            firstName: firstName,
                            lastName: lastName
                        )
                        promise(.success(user))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func signIn(email: String, password: String) -> AnyPublisher<User, AuthError> {
        return Future { promise in
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if let error = error {
                    promise(.failure(.signInFailed(error.localizedDescription)))
                    return
                }
                
                guard let authResult = authResult else {
                    promise(.failure(.signInFailed("Unknown error occurred")))
                    return
                }
                
                // Fetch additional user data from Firestore
                let db = Firestore.firestore()
                db.collection("users").document(authResult.user.uid).getDocument { (document, error) in
                    if let error = error {
                        promise(.failure(.signInFailed(error.localizedDescription)))
                        return
                    }
                    
                    guard let document = document,
                          let data = document.data(),
                          let firstName = data["firstName"] as? String,
                          let lastName = data["lastName"] as? String else {
                        promise(.failure(.signInFailed("Failed to get user data")))
                        return
                    }
                    
                    let user = User(
                        id: authResult.user.uid,
                        email: authResult.user.email ?? "",
                        username: authResult.user.displayName ?? "",
                        firstName: firstName,
                        lastName: lastName
                    )
                    promise(.success(user))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func signOut() -> AnyPublisher<Void, AuthError> {
        return Future { promise in
            do {
                try Auth.auth().signOut()
                promise(.success(()))
            } catch {
                promise(.failure(.signOutFailed(error.localizedDescription)))
            }
        }
        .eraseToAnyPublisher()
    }
}

```

# Smile/Services/DataService.swift

```swift
//
//  DataService.swift
//  Smile
//
//  Created by David Ding on 9/18/24.
//

import Foundation
import Combine

protocol DataService {
    // Auth
    func signIn(email: String, password: String) async throws -> User
    func signUp(email: String, password: String, username: String, firstName: String, lastName: String) async throws -> User
    func signOut() async throws
    
    // Posts and Images
    func uploadImage(_ data: Data) async throws -> String
    func createPost(userId: String, username: String, imagePath: String, caption: String, taggedUsers: [String]) async throws
    func searchUsers(matching query: String) async throws -> [UserPreview]
    
    // Profile
    func uploadProfileImage(_ data: Data, path: String) async throws -> URL
    func updateUserProfileImage(userId: String, imageUrl: String, type: ProfileImageType) async throws
    func fetchUserProfile(userId: String) async throws -> User
    
    // Fetch Posts
    func fetchUserPosts(userId: String, limit: Int, after post: Post?) async throws -> [Post]
    func fetchTaggedPosts(userId: String, limit: Int, after post: Post?) async throws -> [Post]
    
    // Comments
    func fetchComments(for postId: String) async throws -> [Comment]
    func addComment(to postId: String, text: String) async throws
    
    // Likes
    func fetchLikeStatus(for postId: String) async throws -> LikeStatus
    func toggleLike(for postId: String) async throws
    
    // User
//    func fetchUser(userId: String) async throws -> User
    
    func fetchUserGroups() async throws -> [UserGroup]
    func createGroup(name: String) async throws -> UserGroup  // Remove photo parameter
    
    func deletePost(_ postId: String) async throws
//    func joinGroup(groupId: String) async throws
//    func leaveGroup(groupId: String) async throws
}

```

# Smile/Services/FirebaseDataService.swift

```swift
//
//  FirebaseDataService.swift
//  Smile
//
//  Created by David Ding on 9/18/24.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import SwiftUI

class FirebaseDataService: DataService {
    
    
    //
    //    func joinGroup(groupId: String) async throws {
    //
    //    }
    //
    //    func leaveGroup(groupId: String) async throws {
    //        <#code#>
    //    }
    func createGroup(name: String) async throws -> UserGroup {
        guard let userId = Auth.auth().currentUser?.uid else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not logged in"])
        }
        
        let db = Firestore.firestore()
        
        let groupData: [String: Any] = [
            "name": name,
            "members": [userId], // Creator is first member
            "createdAt": FieldValue.serverTimestamp(),
            "createdBy": userId,
        ]
        
        let documentRef = try await db.collection("groups").addDocument(data: groupData)
        
        return UserGroup(
            id: documentRef.documentID,
            name: name,
            photoUrl: nil,
            memberCount: 1,
            createdAt: Date(),
            createdBy: userId
        )
    }
    
    
    func uploadImage(_ data: Data) async throws -> String {
        let imageName = UUID().uuidString + ".jpg"
        let path = "post_images/\(imageName)"
        let storageRef = Storage.storage().reference().child(path)
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        _ = try await storageRef.putDataAsync(data, metadata: metadata)
//        print("Image uploaded successfully to path: \(path)")
        
        // Return the path instead of URL
        return path
    }
    
    func createPost(userId: String, username: String, imagePath: String, caption: String, taggedUsers: [String]) async throws {
        let db = Firestore.firestore()
        let postRef = db.collection("posts").document()
        
        let postData: [String: Any] = [
            "userId": userId,
            "username": username,
            "imagePath": imagePath,  // Store path instead of URL
            "caption": caption,
            "taggedUsers": taggedUsers,
            "createdAt": FieldValue.serverTimestamp(),
            "likeCount": 0,
            "commentCount": 0
        ]
        
        try await postRef.setData(postData)
    }
    
    func fetchPosts() -> AnyPublisher<[Post], Error> {
        let db = Firestore.firestore()
        
        return Future { promise in
            Task {
                do {
                    let snapshot = try await db.collection("posts")
                        .order(by: "createdAt", descending: true)
                        .limit(to: 20)
                        .getDocuments()
                    
                    let posts = snapshot.documents.compactMap { document -> Post? in
                        do {
                            var post = try document.data(as: Post.self)
                            post.id = document.documentID
                            return post
                        } catch {
                            print("Error decoding post: \(error)")
                            return nil
                        }
                    }
                    
                    promise(.success(posts))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func signIn(email: String, password: String) async throws -> User {
        // Sign in with Firebase Auth
        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
        let firebaseUser = authResult.user  // No need for guard let, this will throw if it fails
        
        // Fetch additional user data from Firestore
        let db = Firestore.firestore()
        let document = try await db.collection("users")
            .document(firebaseUser.uid)
            .getDocument()
        
        guard let data = document.data(),
              let username = data["username"] as? String,
              let firstName = data["firstName"] as? String,
              let lastName = data["lastName"] as? String else {
            throw NSError(domain: "FirebaseDataService", code: 0,
                          userInfo: [NSLocalizedDescriptionKey: "Failed to get user data"])
        }
        
        return User(
            id: firebaseUser.uid,
            email: firebaseUser.email ?? email,
            username: username,
            firstName: firstName,
            lastName: lastName,
            profilePictureUrl: data["profilePictureUrl"] as? String,
            bannerPictureUrl: data["bannerPictureUrl"] as? String
        )
    }
    
    func signUp(email: String, password: String, username: String, firstName: String, lastName: String) async throws -> User {
        // Ensure username is lowercase and has no spaces
        let cleanUsername = username.lowercased().filter { !$0.isWhitespace }
        
        // Check if username exists first
        let db = Firestore.firestore()
        let usernameSnapshot = try await db.collection("users")
            .whereField("username", isEqualTo: cleanUsername)
            .getDocuments()
        
        if !usernameSnapshot.documents.isEmpty {
            throw NSError(
                domain: "",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "Username already taken"]
            )
        }
        
        // Create user in Firebase Auth
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let firebaseUser = authResult.user
        
        // Update display name
        let changeRequest = firebaseUser.createProfileChangeRequest()
        changeRequest.displayName = cleanUsername
        try await changeRequest.commitChanges()
        
        // Create user document in Firestore
        let userData: [String: Any] = [
            "username": cleanUsername,
            "email": email,
            "firstName": firstName,
            "lastName": lastName,
            "createdAt": FieldValue.serverTimestamp()
        ]
        
        try await db.collection("users")
            .document(firebaseUser.uid)
            .setData(userData)
        
        return User(
            id: firebaseUser.uid,
            email: email,
            username: cleanUsername,
            firstName: firstName,
            lastName: lastName
        )
    }
    
    
    func signOut() async throws {
        try Auth.auth().signOut()
    }
    
    func searchUsers(matching query: String) async throws -> [UserPreview] {
        let db = Firestore.firestore()
        let cleanQuery = query.lowercased().filter { !$0.isWhitespace }
        
        let snapshot = try await db.collection("users")
            .whereField("username", isGreaterThanOrEqualTo: cleanQuery)
            .whereField("username", isLessThan: cleanQuery + "\u{f8ff}")
            .limit(to: 20)
            .getDocuments()
        
        return snapshot.documents.compactMap { document in
            guard let username = document.data()["username"] as? String else {
                return nil
            }
            return UserPreview(
                id: document.documentID,
                username: username,
                profilePictureUrl: document.data()["profilePictureUrl"] as? String
            )
        }
    }
    
    func uploadProfileImage(_ data: Data, path: String) async throws -> URL {
        let storageRef = Storage.storage().reference().child(path)
        
        // Upload the data
        _ = try await storageRef.putDataAsync(data)
        
        // Get the download URL
        return try await storageRef.downloadURL()
    }
    
    func updateUserProfileImage(userId: String, imageUrl: String, type: ProfileImageType) async throws {
        let db = Firestore.firestore()
        let field = type == .profilePicture ? "profilePictureUrl" : "bannerPictureUrl"
        
        try await db.collection("users").document(userId)
            .setData([field: imageUrl], merge: true)
    }
    
    func fetchUserPosts(userId: String, limit: Int = 12, after post: Post? = nil) async throws -> [Post] {
        let db = Firestore.firestore()
        //        print("Fetching posts for userId: \(userId)") // Add debug print
        
        var query = db.collection("posts")
            .whereField("userId", isEqualTo: userId)
            .order(by: "createdAt", descending: true)
            .limit(to: limit)
        
        if let post = post, let postDate = post.createdAt {
            query = query.start(after: [postDate])
        }
        
        let snapshot = try await query.getDocuments()
        //        print("Found \(snapshot.documents.count) documents") // Add debug print
        
        let posts = snapshot.documents.compactMap { document -> Post? in
            do {
                var post = try document.data(as: Post.self)
                // Ensure the post has an ID
                post.id = document.documentID
                return post
            } catch {
                print("Error decoding post document: \(error)") // Add debug print
                return nil
            }
        }
        
        //        print("Successfully decoded \(posts.count) posts") // Add debug print
        return posts
    }
    
    func fetchTaggedPosts(userId: String, limit: Int = 12, after post: Post? = nil) async throws -> [Post] {
        let db = Firestore.firestore()
        //        print("Fetching tagged posts for userId: \(userId)") // Add debug print
        
        var query = db.collection("posts")
            .whereField("taggedUsers", arrayContains: userId)
            .order(by: "createdAt", descending: true)
            .limit(to: limit)
        
        if let post = post, let postDate = post.createdAt {
            query = query.start(after: [postDate])
        }
        
        let snapshot = try await query.getDocuments()
        //        print("Found \(snapshot.documents.count) tagged documents") // Add debug print
        
        let posts = snapshot.documents.compactMap { document -> Post? in
            do {
                var post = try document.data(as: Post.self)
                // Ensure the post has an ID
                post.id = document.documentID
                return post
            } catch {
                print("Error decoding tagged post document: \(error)") // Add debug print
                return nil
            }
        }
        
        //        print("Successfully decoded \(posts.count) tagged posts") // Add debug print
        return posts
    }
    
    func fetchComments(for postId: String) async throws -> [Comment] {
        guard !postId.isEmpty else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid post ID"])
        }
        
        let db = Firestore.firestore()
        let snapshot = try await db.collection("posts")
            .document(postId)
            .collection("comments")
            .order(by: "createdAt", descending: false)
            .getDocuments()
        
        return snapshot.documents.compactMap { try? $0.data(as: Comment.self) }
    }
    
    func addComment(to postId: String, text: String) async throws {
        guard !postId.isEmpty else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid post ID"])
        }
        
        guard let currentUser = Auth.auth().currentUser else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not logged in"])
        }
        
        let db = Firestore.firestore()
        
        // Get current user's username
        let userDoc = try await db.collection("users").document(currentUser.uid).getDocument()
        guard let username = userDoc.data()?["username"] as? String else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Could not get username"])
        }
        
        // Create the comment
        let comment = Comment(
            userId: currentUser.uid,
            username: username,
            text: text,
            createdAt: nil  // Will be set by server timestamp
        )
        
        // Add comment document
        let commentRef = db.collection("posts")
            .document(postId)
            .collection("comments")
            .document()
        
        try await commentRef.setData([
            "userId": comment.userId,
            "username": comment.username,
            "text": comment.text,
            "createdAt": FieldValue.serverTimestamp()
        ])
        
        // Update comment count
        try await db.collection("posts")
            .document(postId)
            .updateData([
                "commentCount": FieldValue.increment(Int64(1))
            ])
    }
    
    func fetchLikeStatus(for postId: String) async throws -> LikeStatus {
        guard let currentUser = Auth.auth().currentUser else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not logged in"])
        }
        
        // Add validation for postId
        guard !postId.isEmpty else {
            print("Warning: Empty post ID in fetchLikeStatus")
            return LikeStatus(isLiked: false, count: 0)
        }
        
        let db = Firestore.firestore()
        
        do {
            // Get post document first to verify it exists
            let postDoc = try await db.collection("posts")
                .document(postId)
                .getDocument()
            
            guard postDoc.exists else {
                print("Warning: Post document does not exist")
                return LikeStatus(isLiked: false, count: 0)
            }
            
            // Get like document
            let likeDoc = try await db.collection("posts")
                .document(postId)
                .collection("likes")
                .document(currentUser.uid)
                .getDocument()
            
            let likeCount = postDoc.data()?["likeCount"] as? Int ?? 0
            let isLiked = likeDoc.exists
            
            return LikeStatus(isLiked: isLiked, count: likeCount)
        } catch {
            print("Error in fetchLikeStatus: \(error)")
            return LikeStatus(isLiked: false, count: 0)
        }
    }
    
    func toggleLike(for postId: String) async throws {
        guard !postId.isEmpty else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid post ID"])
        }
        
        guard let currentUser = Auth.auth().currentUser else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not logged in"])
        }
        
        let db = Firestore.firestore()
        let likeRef = db.collection("posts")
            .document(postId)
            .collection("likes")
            .document(currentUser.uid)
        
        let likeDoc = try await likeRef.getDocument()
        
        // Store the result of runTransaction
        let _ = try await db.runTransaction { transaction, errorPointer in
            let postRef = db.collection("posts").document(postId)
            
            if likeDoc.exists {
                // Unlike
                transaction.deleteDocument(likeRef)
                transaction.updateData([
                    "likeCount": FieldValue.increment(Int64(-1))
                ], forDocument: postRef)
            } else {
                // Like
                transaction.setData([:], forDocument: likeRef)
                transaction.updateData([
                    "likeCount": FieldValue.increment(Int64(1))
                ], forDocument: postRef)
            }
            
            return nil
        }
    }
    
    func fetchUserProfile(userId: String) async throws -> User {
        guard !userId.isEmpty else {
            throw NSError(
                domain: "FirebaseDataService",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "User ID cannot be empty"]
            )
        }
        
//        print("Fetching user profile for ID: \(userId)") // Debug print
        
        let db = Firestore.firestore()
        let document = try await db.collection("users").document(userId).getDocument()
        
        // Debug print the raw data
//        print("Firestore document data: \(String(describing: document.data()))")
        
        guard let data = document.data(),
              let username = data["username"] as? String,
              let email = data["email"] as? String,
              let firstName = data["firstName"] as? String,
              let lastName = data["lastName"] as? String else {
            // Print which fields are missing
//            let data = document.data()
//            print("Missing or invalid fields in user document:")
//            print("username: \(data?["username"] ?? "missing")")
//            print("email: \(data?["email"] ?? "missing")")
//            print("firstName: \(data?["firstName"] ?? "missing")")
//            print("lastName: \(data?["lastName"] ?? "missing")")
            throw NSError(
                domain: "FirebaseDataService",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "Failed to get user data"]
            )
        }
        
        // If we get here, we successfully created a user
//        print("Successfully created User object with username: \(username)")
        
        return User(
            id: userId,
            email: email,
            username: username,
            firstName: firstName,
            lastName: lastName,
            profilePictureUrl: data["profilePictureUrl"] as? String,
            bannerPictureUrl: data["bannerPictureUrl"] as? String
        )
    }
    
    func fetchUserGroups() async throws -> [UserGroup] {
        guard let userId = Auth.auth().currentUser?.uid else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not logged in"])
        }
        
        let db = Firestore.firestore()
        let snapshot = try await db.collection("groups")
            .whereField("members", arrayContains: userId)
            .getDocuments()
        
        return try snapshot.documents.map { document in
            let data = document.data()
            
            // If any of these fields are missing, throw an error
            guard
                let name = data["name"] as? String,
                let members = data["members"] as? [String],
                let createdAt = (data["createdAt"] as? Timestamp)?.dateValue(),
                let createdBy = data["createdBy"] as? String
            else {
                throw NSError(domain: "", code: -1,
                             userInfo: [NSLocalizedDescriptionKey: "Invalid group data"])
            }
            
            return UserGroup(
                id: document.documentID,
                name: name,
                photoUrl: data["photoUrl"] as? String,
                memberCount: members.count,
                createdAt: createdAt,
                createdBy: createdBy
            )
        }
    }
    
    func deletePost(_ postId: String) async throws {
        let db = Firestore.firestore()
        let storage = Storage.storage()
        
        // Get the post first to get the image path
        let postDoc = try await db.collection("posts").document(postId).getDocument()
        guard let post = try? postDoc.data(as: Post.self) else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Post not found"])
        }
        
        // Delete the image from storage
        let storageRef = storage.reference().child(post.imagePath)
        try await storageRef.delete()
        
        // Delete the post document and all its subcollections
        try await db.collection("posts").document(postId).delete()
    }
}

```

# Smile/Services/NetworkService.swift

```swift
//
//  NetworkService.swift
//  Smile
//
//  Created by David Ding on 7/23/24.
//

import Foundation

```

# Smile/SmileApp.swift

```swift
//
//  SmileApp.swift
//  Smile
//
//  Created by David Ding on 7/18/23.
//

import SwiftUI
import FirebaseCore
import Firebase

@main
struct SmileApp: App {
    @StateObject private var appState = AppState()
    @StateObject private var authViewModel = AuthViewModel()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(appState)
                .environmentObject(authViewModel)
        }
    }
}

```

# Smile/State/AppState.swift

```swift
//
//  AppState.swift
//  Smile
//
//  Created by David Ding on 11/6/24.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

class AppState: ObservableObject {
    @Published var posts: [Post] = []
    @Published var userPosts: [Post] = []
    @Published var taggedPosts: [Post] = []
    private let dataService: DataService
    
    init(dataService: DataService = FirebaseDataService()) {
        self.dataService = dataService
    }
    
    @MainActor
    func refreshAllPosts() async {
        do {
            let snapshot = try await Firestore.firestore()
                .collection("posts")
                .order(by: "createdAt", descending: true)
                .limit(to: 20)
                .getDocuments()
            
            posts = snapshot.documents.compactMap { document in
                do {
                    var post = try document.data(as: Post.self)
                    post.id = document.documentID
//                    print("Loaded post: \(post.id ?? "unknown"), imagePath: \(post.imagePath)")
                    return post
                } catch {
                    print("Error decoding post: \(error)")
                    return nil
                }
            }
        } catch {
            print("Error refreshing posts: \(error)")
        }
    }
    
    @MainActor
    func refreshUserPosts() async {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        do {
            // Fetch user's uploaded posts
            userPosts = try await dataService.fetchUserPosts(userId: userId, limit: 12, after: nil)
            
            // Fetch posts where user is tagged
            taggedPosts = try await dataService.fetchTaggedPosts(userId: userId, limit: 12, after: nil)
        } catch {
            print("Error refreshing user posts: \(error)")
        }
    }
    
    @MainActor
    func postAdded() async {
        do {
            // Wait for 1 second to allow Firebase to process
            try await Task.sleep(nanoseconds: 1_000_000_000)
            
            // Refresh posts
            await refreshUserPosts()
            await refreshAllPosts()
            
//            print("AppState postAdded: Posts refreshed")
            
            // Print the paths of the most recent posts to verify
            if let latestPost = userPosts.first {
                print("Latest post path: \(latestPost.imagePath)")
            }
        } catch {
            print("Error in postAdded: \(error)")
        }
    }
}

```

# Smile/Utils/Constants.swift

```swift
//
//  Constants.swift
//  Smile
//
//  Created by David Ding on 7/23/24.
//

import Foundation

```

# Smile/Utils/DateFormattingHelper.swift

```swift
//
//  DateFormattingHelper.swift
//  Smile
//
//  Created by David Ding on 11/21/24.
//


import Foundation

struct DateFormattingHelper {
    static let shared = DateFormattingHelper()
    private let formatter: RelativeDateTimeFormatter
    private let absoluteFormatter: DateFormatter
    
    init() {
        formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        
        absoluteFormatter = DateFormatter()
        absoluteFormatter.dateStyle = .medium
        absoluteFormatter.timeStyle = .short
    }
    
    func format(date: Date?) -> String {
        guard let date = date else { return "Unknown" }
        
        let now = Date()
        let difference = Calendar.current.dateComponents([.day], from: date, to: now)
        
        // If more than 7 days old, show absolute date
        if let days = difference.day, days > 7 {
            return absoluteFormatter.string(from: date)
        }
        
        // Otherwise show relative time
        return formatter.localizedString(for: date, relativeTo: now)
    }
}
```

# Smile/Utils/Extensions.swift

```swift
//
//  Extensions.swift
//  Smile
//
//  Created by David Ding on 11/21/24.
//

import SwiftUI

extension View {
    func formattedDate(_ date: Date?) -> some View {
        let formattedString = DateFormattingHelper.shared.format(date: date)
        return Text(formattedString)
    }
    
    func cardStyle() -> some View {
        modifier(Theme.CardStyle())
    }
}

```

# Smile/Utils/Theme.swift

```swift
//
//  Theme.swift
//  Smile
//
//  Created by David Ding on 11/17/24.
//

import SwiftUI

enum Theme {
    enum Colors {
        static let brandPrimary = Color("BrandPrimary")
        static let brandSecondary = Color("BrandSecondary")
        static let background = Color("AppBackground")
        static let surface = Color("AppSurface")
        static let textPrimary = Color("BrandPrimary")
        static let textSecondary = Color("BrandSecondary")
    }
    
    enum Typography {
        static let titleLarge = Font.system(size: 24, weight: .bold)
        static let titleMedium = Font.system(size: 20, weight: .semibold)
        static let titleSmall = Font.system(size: 16, weight: .semibold)
        static let bodyLarge = Font.system(size: 16, weight: .regular)
        static let bodyMedium = Font.system(size: 14, weight: .regular)
        static let caption = Font.system(size: 12, weight: .regular)
    }
    
    enum Metrics {
        static let padding: CGFloat = 16
        static let cornerRadius: CGFloat = 12
        static let iconSize: CGFloat = 24
        static let avatarSize: CGFloat = 40
    }
    
    enum Animation {
        static let `default` = SwiftUI.Animation.easeInOut(duration: 0.2)
        static let spring = SwiftUI.Animation.spring(response: 0.3, dampingFraction: 0.7)
    }
}

// MARK: - View Modifiers
extension Theme {
    struct CardStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .padding(Metrics.padding)
                .background(Colors.surface)
                .cornerRadius(Metrics.cornerRadius)
                .shadow(color: .black.opacity(0.05), radius: 8)
        }
    }
}

```

# Smile/ViewModels/AuthViewModel.swift

```swift
//
//  AuthViewModel.swift
//  Smile
//
//  Created by David Ding on 7/23/24.
//

import Foundation
import SwiftUI
import UIKit

class AuthViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var authError: String = ""
    private let dataService: DataService
    
    init(dataService: DataService = FirebaseDataService()) {
        self.dataService = dataService
//        print("AuthViewModel initialized")
    }
    
    var isAuthenticated: Bool {
        return currentUser != nil
    }
    
    @MainActor
    func signUp(email: String, password: String, username: String, firstName: String, lastName: String) {
        Task {
            do {
                let user = try await dataService.signUp(
                    email: email,
                    password: password,
                    username: username,
                    firstName: firstName,
                    lastName: lastName
                )
                currentUser = user
                authError = ""
            } catch {
                authError = error.localizedDescription
            }
        }
    }
    
    @MainActor
    func signIn(email: String, password: String) {
        Task {
            do {
//                print("Attempting to sign in with email: \(email)")
                let user = try await dataService.signIn(email: email, password: password)
//                print("Sign in successful. User: \(user)")
                currentUser = user
                authError = ""
            } catch {
                print("Sign in error: \(error.localizedDescription)")
                authError = error.localizedDescription
            }
        }
    }
    
    @MainActor
    func signOut() async {
        do {
            try await dataService.signOut()
            currentUser = nil
            authError = ""
        } catch {
            authError = error.localizedDescription
        }
    }
    
    func updateProfileImage(_ image: UIImage, type: ProfileImageType) async throws {
        guard let currentUser = currentUser else { return }
        guard let imageData = type == .profilePicture ?
            image.jpegData(compressionQuality: 0.5) :
            image.jpegData(compressionQuality: 0.7) else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to convert image to data"])
        }
        
        let path = type == .profilePicture ?
            "profile_pictures/\(currentUser.id).jpg" :
            "profile_banners/\(currentUser.id).jpg"
        
        // First upload the image
        let imageUrl = try await dataService.uploadProfileImage(imageData, path: path)
        
        // Then update the user profile
        try await dataService.updateUserProfileImage(
            userId: currentUser.id,
            imageUrl: imageUrl.absoluteString,
            type: type
        )
        
        // Update the current user object with the new image URL
        await MainActor.run {
            var updatedUser = currentUser
            if type == .profilePicture {
                updatedUser.profilePictureUrl = imageUrl.absoluteString
            } else {
                updatedUser.bannerPictureUrl = imageUrl.absoluteString
            }
            self.currentUser = updatedUser
        }
    }
}

```

# Smile/ViewModels/HomeViewModel.swift

```swift
//
//  HomeViewModel.swift
//  Smile
//
//  Created by David Ding on 10/14/24.
//

import SwiftUI
import Firebase
import Combine

class HomeViewModel: ObservableObject {
    @Published var posts: [Post] = []
    private var cancellables = Set<AnyCancellable>()
    private let dataService = FirebaseDataService()

    func fetchPosts() {
        dataService.fetchPosts()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching posts: \(error)")
                }
            }, receiveValue: { [weak self] posts in
                self?.posts = posts
            })
            .store(in: &cancellables)
    }
}

```

# Smile/ViewModels/PostDetailViewModel.swift

```swift
//
//  PostDetailViewModel.swift
//  Smile
//
//  Created by David Ding on 10/28/24.
//
import SwiftUI
import Combine
import FirebaseAuth

@MainActor
class PostDetailViewModel: ObservableObject {
    @Published var comments: [Comment] = []
    @Published var likeCount: Int = 0
    @Published var isLiked: Bool = false
    @Published var isCommentingActive: Bool = false
    @Published var newCommentText: String = ""
    @Published var userProfilePicture: String?
    @Published var showDeleteConfirmation = false
    @Published var isDeleting = false
    
    private let post: Post
    private let dataService: DataService
    var onPostDeleted: (() -> Void)?
    
    init(post: Post, dataService: DataService = FirebaseDataService()) {
        self.post = post
        self.dataService = dataService
        
        Task {
            await fetchComments()
            await fetchLikeStatus()
            await fetchUserProfile()
        }
    }
    
    func deletePost() async {
        guard let postId = post.id else { return }
        isDeleting = true
        
        do {
            try await dataService.deletePost(postId)
            onPostDeleted?()
            isDeleting = false
        } catch {
            print("Error deleting post: \(error)")
            isDeleting = false
        }
    }
    
    func fetchComments() async {
        do {
            comments = try await dataService.fetchComments(for: post.uniqueId)
        } catch {
            print("Error fetching comments: \(error)")
        }
    }
    
    func fetchLikeStatus() async {
        guard let postId = post.id, !postId.isEmpty else {
            print("Warning: Invalid post ID in fetchLikeStatus")
            isLiked = false
            likeCount = 0
            return
        }
        
        do {
            let status = try await dataService.fetchLikeStatus(for: postId)
            isLiked = status.isLiked
            likeCount = status.count
        } catch {
            print("Error fetching like status: \(error)")
            isLiked = false
            likeCount = 0
        }
    }
    
    func fetchUserProfile() async {
        do {
            let profile = try await dataService.fetchUserProfile(userId: post.userId)
            userProfilePicture = profile.profilePictureUrl
        } catch {
            print("Error fetching user profile: \(error)")
        }
    }
    
    func toggleLike() {
        guard let postId = post.id, !postId.isEmpty else {
            print("Warning: Invalid post ID in toggleLike")
            return
        }
        
        Task {
            do {
                isLiked.toggle()
                if isLiked {
                    likeCount += 1
                } else {
                    likeCount -= 1
                }
                
                try await dataService.toggleLike(for: postId)
            } catch {
                // Revert on failure
                isLiked.toggle()
                likeCount += isLiked ? 1 : -1
                print("Error toggling like: \(error)")
            }
        }
    }
    
    func addComment() async {
        guard !newCommentText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        
        do {
            try await dataService.addComment(to: post.uniqueId, text: newCommentText)
            newCommentText = ""
            await fetchComments()
        } catch {
            print("Error adding comment: \(error)")
        }
    }
}

```

# Smile/ViewModels/ProfileViewModel.swift

```swift
//
//  ProfileViewModel.swift
//  Smile
//
//  Created by David Ding on 10/27/24.
//

import SwiftUI
import Firebase
import Combine

@MainActor
class ProfileViewModel: ProfileLoading {
    @Published var user: User?
    @Published var uploadedPosts: [Post] = []
    @Published var taggedPosts: [Post] = []
    @Published var isLoading = false
    @Published var error: String?
    @Published var isImagePickerShowing = false
    @Published var profileImageType: ProfileImageType = .profilePicture
    @Published var showingSettingsSheet = false
    
    let dataService: DataService
    var userId: String { authViewModel.currentUser?.id ?? "" }
    
    private var authViewModel: AuthViewModel
    
    init(authViewModel: AuthViewModel, dataService: DataService = FirebaseDataService()) {
        self.authViewModel = authViewModel
        self.dataService = dataService
        self.user = authViewModel.currentUser  // Directly set the user
        Task {
            await loadProfile()
        }
    }
    
    func updateAuthViewModel(_ newAuthViewModel: AuthViewModel) {
        self.authViewModel = newAuthViewModel
        if authViewModel.currentUser != nil {
            Task {
                await loadProfile()
            }
        }
    }
    
    func updateProfileImage(_ image: UIImage, type: ProfileImageType) async {
        do {
            try await authViewModel.updateProfileImage(image, type: type)
            await loadUserPosts()
        } catch {
            self.error = error.localizedDescription
        }
    }
    
    func signOut() async {
        await authViewModel.signOut()
    }
    
    func removePost(_ post: Post) {
        // Remove from uploaded posts
        uploadedPosts.removeAll { $0.id == post.id }
        
        // Remove from tagged posts if applicable
        taggedPosts.removeAll { $0.id == post.id }
    }
}
    // Future methods could include:
    // - updateProfile(firstName:lastName:bio:)
    // - updatePrivacySettings
    // - updateNotificationPreferences
    // - deleteAccount
    // - blockUser
    // - etc.


```

# Smile/ViewModels/SearchViewModel.swift

```swift
//
//  SearchViewModel.swift
//  Smile
//
//  Created by David Ding on 11/9/24.
//

import SwiftUI
import Combine
import FirebaseAuth

@MainActor
class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var searchResults: [UserPreview] = []
    private var searchTask: Task<Void, Never>?
    private let dataService: DataService
    private var cancellables = Set<AnyCancellable>()
    
    init(dataService: DataService = FirebaseDataService()) {
        self.dataService = dataService
        setupSearchSubscription()
    }
    
    private func setupSearchSubscription() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] text in
                guard let self = self else { return }
                self.searchTask?.cancel()
                
                guard !text.isEmpty else {
                    self.searchResults = []
                    return
                }
                
                self.searchTask = Task {
                    do {
                        let results = try await self.dataService.searchUsers(matching: text)
                        if !Task.isCancelled {
                            self.searchResults = results
                        }
                    } catch {
                        print("Search error: \(error)")
                    }
                }
            }
            .store(in: &cancellables)
    }
}

```

# Smile/ViewModels/TaggingViewModel.swift

```swift
//
//  TaggingViewModel.swift
//  Smile
//
//  Created by David Ding on 10/22/24.
//
import SwiftUI
import Firebase
import Combine

class TaggingViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var searchResults: [UserPreview] = []
    @Published var taggedUsers: [UserPreview] = []
    private let dataService: DataService
    private var searchTask: Task<Void, Never>?
    
    init(dataService: DataService = FirebaseDataService()) {
        self.dataService = dataService
        
        // Set up search functionality with debounce
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] text in
                guard let self = self else { return }
                self.searchTask?.cancel()
                
                if text.isEmpty {
                    Task { @MainActor in
                        self.searchResults = []  // Ensure results are cleared when search is empty
                    }
                    return
                }
                
                self.searchTask = Task {
                    await self.searchUsers(matching: text)
                }
            }
            .store(in: &cancellables)
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    @MainActor
    private func searchUsers(matching query: String) async {
        do {
            searchResults = try await dataService.searchUsers(matching: query)
        } catch {
            print("Error searching users: \(error)")
            searchResults = []
        }
    }
    
    func tagUser(_ user: UserPreview) {
        if !taggedUsers.contains(user) {
            taggedUsers.append(user)
        }
    }
    
    func removeTag(_ user: UserPreview) {
        taggedUsers.removeAll { $0.id == user.id }
    }
}

```

# Smile/ViewModels/UserViewModel.swift

```swift
//
//  UserViewModel.swift
//  Smile
//
//  Created by David Ding on 7/23/24.
//

import Foundation

@MainActor
class UserViewModel: ProfileLoading {
    @Published var user: User?
    @Published var uploadedPosts: [Post] = []
    @Published var taggedPosts: [Post] = []
    @Published var isLoading = false
    @Published var error: String?
    @Published var isFollowing = false
    
    let dataService: DataService
    let userId: String
    
    init(userId: String, dataService: DataService = FirebaseDataService()) {
        self.userId = userId
        self.dataService = dataService
        Task {
            await loadProfile()
        }
    }
    
    func toggleFollow() {
        // Implement follow/unfollow logic here
        isFollowing.toggle()
    }
    
    func sendMessage() {
        // Implement message sending logic here
    }
}

```

# Smile/Views/Components/PostFeedCell.swift

```swift
//
//  PostFeedCell.swift
//  Smile
//
//  Created by David Ding on 11/19/24.
//
import SwiftUI

struct PostFeedCell: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var viewModel: PostDetailViewModel
    let post: Post
    
    // Calculate image size based on screen width
    private var imageSize: CGFloat {
        UIScreen.main.bounds.width - (Theme.Metrics.padding * 4)
    }
    
    init(post: Post) {
        self.post = post
        _viewModel = StateObject(wrappedValue: PostDetailViewModel(post: post))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: Theme.Metrics.padding) {
            // Header
            header
            
            // Image
            postImage
                .frame(width: imageSize, height: imageSize)
                .clipped()
            
            // Actions
            actions
            
            // Content
            content
        }
        .cardStyle()
        .padding(.horizontal, Theme.Metrics.padding)
    }
    
    private var header: some View {
        HStack(spacing: Theme.Metrics.padding) {
            AsyncImage(url: URL(string: viewModel.userProfilePicture ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: Theme.Metrics.avatarSize, height: Theme.Metrics.avatarSize)
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 2) {
                Text(post.username)
                    .font(Theme.Typography.titleSmall)
                if let date = post.createdAt {
                    formattedDate(date)
                        .font(Theme.Typography.caption)
                        .foregroundColor(Theme.Colors.textSecondary)
                }
            }
            
            Spacer()
            
            Menu {
                Button(action: {}) {
                    Label("Report", systemImage: "flag")
                }
                Button(action: {}) {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
            } label: {
                Image(systemName: "ellipsis")
                    .foregroundColor(Theme.Colors.textSecondary)
                    .padding(8)
            }
        }
    }
    
    private var postImage: some View {
        PostImageView(imagePath: post.imagePath, size: imageSize)
            .clipShape(RoundedRectangle(cornerRadius: Theme.Metrics.cornerRadius))
    }
    
    private var actions: some View {
        HStack(spacing: Theme.Metrics.padding * 1.5) {
            Button {
                viewModel.toggleLike()
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: viewModel.isLiked ? "heart.fill" : "heart")
                        .foregroundColor(viewModel.isLiked ? .red : Theme.Colors.textPrimary)
                    Text("\(viewModel.likeCount)")
                        .font(Theme.Typography.bodyMedium)
                }
            }
            
            NavigationLink {
                PostDetailView(post: post)
                    .onDisappear {
                        Task {
                            await appState.refreshAllPosts()
                        }
                    }
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: "bubble.right")
                    Text("\(post.commentCount)")
                        .font(Theme.Typography.bodyMedium)
                }
            }
            
            Button {
                // Share functionality
            } label: {
                Image(systemName: "square.and.arrow.up")
            }
            
            Spacer()
        }
        .foregroundColor(Theme.Colors.textPrimary)
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: 8) {
            if !post.caption.isEmpty {
                Text(post.username).font(Theme.Typography.titleSmall) +
                Text(" \(post.caption)")
                    .font(Theme.Typography.bodyMedium)
            }
            
            if !viewModel.comments.isEmpty {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(viewModel.comments.prefix(2)) { comment in
                        HStack {
                            Text(comment.username)
                                .font(Theme.Typography.bodyMedium)
                                .fontWeight(.semibold)
                            Text(comment.text)
                                .font(Theme.Typography.bodyMedium)
                                .lineLimit(1)
                        }
                    }
                }
                .padding(.top, 4)
            }
        }
    }
}

```

# Smile/Views/Components/PostImageView.swift

```swift
//
//  PostImageView.swift
//  Smile
//
//  Created by David Ding on 11/6/24.
//

import SwiftUI
import FirebaseStorage

actor ImageCache {
    static let shared = ImageCache()
    private var cache: [String: UIImage] = [:]
    
    func image(for key: String) -> UIImage? {
        cache[key]
    }
    
    func setImage(_ image: UIImage, for key: String) {
        cache[key] = image
    }
}

struct PostImageView: View {
    let imagePath: String
    let size: CGFloat
    
    @State private var image: UIImage?
    @State private var isLoading = true
    @State private var loadError: Error?
    
    var body: some View {
        GeometryReader { geometry in
            Group {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size, height: size)
                } else if loadError != nil {
                    VStack {
                        Image(systemName: "exclamationmark.triangle")
                        Text("Error")
                            .font(Theme.Typography.caption)
                    }
                    .foregroundColor(.red)
                    .frame(width: size, height: size)
                } else {
                    ProgressView()
                        .frame(width: size, height: size)
                }
            }
        }
        .frame(width: size, height: size)
        .clipped()
        .task(id: imagePath) {
            await loadImage()
        }
    }
    
    private func loadImage() async {
        // First check cache
        if let cached = await ImageCache.shared.image(for: imagePath) {
            await MainActor.run {
                self.image = cached
                self.isLoading = false
            }
            return
        }
        
        do {
            let url = try await PostImage.getURL(for: imagePath)
            let (data, _) = try await URLSession.shared.data(from: url)
            
            guard let uiImage = UIImage(data: data) else {
                throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid image data"])
            }
            
            // Cache the image
            await ImageCache.shared.setImage(uiImage, for: imagePath)
            
            await MainActor.run {
                self.image = uiImage
                self.isLoading = false
            }
        } catch {
            print("Error loading image for path \(imagePath): \(error)")
            await MainActor.run {
                self.loadError = error
                self.isLoading = false
            }
        }
    }
}

```

# Smile/Views/Components/PostsGridView.swift

```swift
//
//  PostsGridView.swift
//  Smile
//
//  Created by David Ding on 12/22/24.
//
import SwiftUI

struct PostsGridView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedTab = 0
    @State private var selectedPost: Post? = nil
    let uploadedPosts: [Post]
    let taggedPosts: [Post]
    let onPostDeleted: ((Post) -> Void)?  // Make callback optional

    var body: some View {
        VStack {
            Picker("Post Type", selection: $selectedTab) {
                Text("Photos").tag(0)
                Text("Tagged").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            let columns = [
                GridItem(.flexible(), spacing: 2),
                GridItem(.flexible(), spacing: 2),
                GridItem(.flexible(), spacing: 2)
            ]
            
            LazyVGrid(columns: columns, spacing: 2) {
                ForEach(selectedTab == 0 ? uploadedPosts : taggedPosts) { post in
                    PostImageView(imagePath: post.imagePath,
                                size: UIScreen.main.bounds.width / 3 - 1)
                        .clipped()
                        .onTapGesture {
                            selectedPost = post
                        }
                }
            }
            .sheet(item: $selectedPost) { post in
                PostDetailView(post: post){
                    // Add the deletion handler here
                    onPostDeleted?(post)
                }
                .onDisappear {
                    Task {
                        await appState.refreshAllPosts()
                    }
                }
                }
        }
    }
}

```

# Smile/Views/Components/SettingsView.swift

```swift
//
//  SettingsView.swift
//  Smile
//
//  Created by David Ding on 12/22/24.
//
import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Button("Sign Out") {
                    Task {
                        await viewModel.signOut()
                    }
                }
                .foregroundColor(.red)
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

```

# Smile/Views/CreateGroupView.swift

```swift
//
//  CreateGroupView.swift
//  Smile
//
//  Created by David Ding on 11/9/24.
//
import SwiftUI

struct CreateGroupView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = CreateGroupViewModel()
    @State private var groupName = ""
    var onGroupCreated: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text("New Group")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Enter a name for the group")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            TextField("Group name", text: $groupName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            HStack(spacing: 20) {
                Button("Cancel") {
                    dismiss()
                }
                .buttonStyle(.bordered)
                
                Button("Create") {
                    Task {
                        await viewModel.createGroup(name: groupName)
                        onGroupCreated()  // Call the refresh callback
                        dismiss()
                    }
                }
                .buttonStyle(.borderedProminent)
                .disabled(groupName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 10)
        .onAppear {
            viewModel.onGroupCreated = onGroupCreated
        }
    }
}

@MainActor
class CreateGroupViewModel: ObservableObject {
    private let dataService: DataService
    var onGroupCreated: (() -> Void)?
    
    init(dataService: DataService = FirebaseDataService()) {
        self.dataService = dataService
    }
    
    func createGroup(name: String) async {
        do {
            _ = try await dataService.createGroup(name: name)
            onGroupCreated?()  // Notify that a group was created
        } catch {
            print("Error creating group: \(error)")
        }
    }
}

```

# Smile/Views/GroupsView.swift

```swift
//
//  GroupsView.swift
//  Smile
//
//  Created by David Ding on 7/31/23.
//

import SwiftUI

struct GroupsView: View {
    @StateObject private var viewModel = GroupsViewModel()
    @State private var showingCreateGroup = false
    @State private var searchText = ""
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 2)
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Search bar
                searchBar
                
                // Groups grid
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.filteredGroups) { group in
                            NavigationLink(destination: GroupDetailView(group: group)) {
                                GroupCell(group: group)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("My Groups")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingCreateGroup = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingCreateGroup) {
                CreateGroupView(onGroupCreated: {
                    Task {
                        await viewModel.fetchGroups()
                    }
                })
                .presentationDetents([.height(250)])
            }
            .task {
                await viewModel.fetchGroups()  // Initial fetch
            }
        }
    }
    
    
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search groups", text: $searchText)
                .textFieldStyle(.plain)
            
            if !searchText.isEmpty {
                Button {
                    searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding()
    }
}

struct GroupCell: View {
    let group: UserGroup

    var body: some View {
        VStack {
            // Group photo
            AsyncImage(url: URL(string: group.photoUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image(systemName: "person.3.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.gray)
                    .frame(width: 80, height: 80)
                    .background(Color(.systemGray6))
            }
            .frame(width: 150, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            // Group name
            Text(group.name)
                .font(.system(size: 16, weight: .semibold))
                .lineLimit(1)
            
            // Member count
            Text("\(group.memberCount) members")
                .font(.system(size: 14))
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
    }
}

// Group model
struct UserGroup: Identifiable {
    let id: String
    let name: String
    let photoUrl: String?
    let memberCount: Int
    let createdAt: Date
    let createdBy: String
}

// ViewModel
@MainActor
class GroupsViewModel: ObservableObject {
    @Published var groups: [UserGroup] = []
    @Published var searchText = ""
    private let dataService: DataService
    
    var filteredGroups: [UserGroup] {
        guard !searchText.isEmpty else { return groups }
        return groups.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    init(dataService: DataService = FirebaseDataService()) {
        self.dataService = dataService
        Task {
            await fetchGroups()
        }
    }
    
    func fetchGroups() async {
        do {
            self.groups = try await dataService.fetchUserGroups()
        } catch {
            print("Error fetching groups: \(error)")
        }
    }
}

// Placeholder for group detail view
struct GroupDetailView: View {
    let group: UserGroup
    
    var body: some View {
        Text("Group Detail View - Coming Soon")
            .navigationTitle(group.name)
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}

```

# Smile/Views/HomeView.swift

```swift
//
//  ContentView.swift
//  Smile
//
//  Created by David Ding on 7/18/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        NavigationView {
            ZStack {
                Theme.Colors.background
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack(spacing: Theme.Metrics.padding) {
                        ForEach(appState.posts) { post in
                            PostFeedCell(post: post)
                                .id(post.uniqueId) // Ensure unique identification
                        }
                    }
                    .padding(.vertical, Theme.Metrics.padding)
                }
                .refreshable {
                    await appState.refreshAllPosts()
                }
            }
            .navigationTitle("Home")
            .task {
                await appState.refreshAllPosts()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

```

# Smile/Views/ImagePicker.swift

```swift
//
//  ImagePicker.swift
//  Smile
//
//  Created by David Ding on 10/24/24.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    let imageType: ProfileImageType
    let onImagePicked: (UIImage) -> Void
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.editedImage] as? UIImage {
                parent.onImagePicked(image)
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

```

# Smile/Views/LoginView.swift

```swift
//
//  LoginView.swift
//  Smile
//
//  Created by David Ding on 7/23/24.
//

import SwiftUI
import Combine

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    @State private var isSignUp = false
    @State private var username = ""
    @State private var firstName = ""
    @State private var lastName = ""
    
    // Add this computed property
    private var formattedUsername: String {
        username.lowercased().trimmingCharacters(in: .whitespaces)
    }
    
    var body: some View {
        NavigationView {
            Form {
                if !isSignUp {
                    Section(header: Text("Login")) {
                        TextField("Email", text: $email)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                        SecureField("Password", text: $password)
                    }
                }
                
                if isSignUp {
                    Section(header: Text("Sign Up Details")) {
                        TextField("Email", text: $email)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                        SecureField("Password", text: $password)
                        TextField("Username", text: $username)
                            .autocapitalization(.none)
                            .onChange(of: username) { newValue in
                                username = newValue.lowercased().filter { !$0.isWhitespace }
                            }
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lastName)
                    }
                }
                
                Section {
                    Button(isSignUp ? "Sign Up" : "Sign In") {
                        if isSignUp {
                            viewModel.signUp(
                                email: email,
                                password: password,
                                username: formattedUsername,
                                firstName: firstName,
                                lastName: lastName
                            )
                        } else {
                            viewModel.signIn(email: email, password: password)
                        }
                    }
                }
                
                Section {
                    Button(isSignUp ? "Already have an account? Sign In" : "Don't have an account? Sign Up") {
                        isSignUp.toggle()
                    }
                }
            }
            .navigationTitle(isSignUp ? "Sign Up" : "Sign In")
            .alert(item: Binding<AuthErrorWrapper?>(
                get: {
                    viewModel.authError.isEmpty ? nil : AuthErrorWrapper(error: viewModel.authError)
                },
                set: { _ in viewModel.authError = "" }
            )) { errorWrapper in
                Alert(title: Text("Error"), message: Text(errorWrapper.error))
            }
        }
    }
}

struct AuthErrorWrapper: Identifiable {
    let id = UUID()
    let error: String
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthViewModel())
    }
}

```

# Smile/Views/PostDetailView.swift

```swift
//
//  PostDetailView.swift
//  Smile
//
//  Created by David Ding on 10/28/24.
//

import SwiftUI
import FirebaseAuth

struct PostDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var appState: AppState
    @StateObject private var viewModel: PostDetailViewModel
    let post: Post
    var onPostDeleted: (() -> Void)?  // Add this line
    
    init(post: Post, onPostDeleted: (() -> Void)? = nil) {
        self.post = post
        self.onPostDeleted = onPostDeleted
        _viewModel = StateObject(wrappedValue: PostDetailViewModel(post: post))
    }
   
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.primary)
                }
                
                Spacer()
                
                Text("Post")
                    .font(.headline)
                
                Spacer()
                
                // Options Menu
                if post.userId == Auth.auth().currentUser?.uid {
                    Menu {
                        Button(role: .destructive) {
                            viewModel.showDeleteConfirmation = true
                        } label: {
                            Label("Delete Post", systemImage: "trash")
                        }
                        
                        Button {
                            // Share functionality
                        } label: {
                            Label("Share", systemImage: "square.and.arrow.up")
                        }
                        
                        Button {
                            // Report functionality
                        } label: {
                            Label("Report", systemImage: "flag")
                        }
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.primary)
                    }
                }
            }
            .padding()
            .background(Color(.systemBackground))
            
            // Content
            GeometryReader { geometry in
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        // User info header
                        HStack {
                            AsyncImage(url: URL(string: viewModel.userProfilePicture ?? "")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Circle()
                                    .foregroundColor(.gray)
                            }
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            
                            Text(post.username)
                                .font(.headline)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        PostImageView(
                            imagePath: post.imagePath,
                            size: geometry.size.width
                        )
                        .frame(width: geometry.size.width)
                        
                        // Action buttons
                        HStack(spacing: 16) {
                            Button {
                                viewModel.toggleLike()
                            } label: {
                                Image(systemName: viewModel.isLiked ? "heart.fill" : "heart")
                                    .foregroundColor(viewModel.isLiked ? .red : .primary)
                            }
                            
                            Button {
                                viewModel.isCommentingActive = true
                            } label: {
                                Image(systemName: "bubble.right")
                            }
                            
                            Button {
                                // Share functionality
                            } label: {
                                Image(systemName: "square.and.arrow.up")
                            }
                            
                            Spacer()
                        }
                        .font(.title3)
                        .padding(.horizontal)
                        
                        // Likes count
                        if viewModel.likeCount > 0 {
                            Text("\(viewModel.likeCount) likes")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                        }
                        
                        // Caption
                        if !post.caption.isEmpty {
                            HStack(alignment: .top, spacing: 4) {
                                Text(post.username)
                                    .fontWeight(.semibold)
                                Text(post.caption)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .padding(.horizontal)
                        }
                        
                        // Comments
                        ForEach(viewModel.comments) { comment in
                            HStack(alignment: .top, spacing: 4) {
                                Text(comment.username)
                                    .fontWeight(.semibold)
                                Text(comment.text)
                                    .fixedSize(horizontal: false, vertical: true)
                                Spacer()
                                Text(comment.timeAgo)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .padding(.horizontal)
                        }
                    }
                    .frame(width: geometry.size.width)
                }
            }
        }
        .alert("Delete Post", isPresented: $viewModel.showDeleteConfirmation) {
            Button("Cancel", role: .cancel) { }
            Button("Delete", role: .destructive) {
                Task {
                    await viewModel.deletePost()
                    await appState.refreshAllPosts()
                    await appState.refreshUserPosts()
                    onPostDeleted?()  // Add this line
                    dismiss()
                }
            }
        } message: {
            Text("Are you sure you want to delete this post? This action cannot be undone.")
        }
        .overlay(alignment: .bottom) {
            if viewModel.isCommentingActive {
                CommentInputView(
                    text: $viewModel.newCommentText,
                    onSubmit: {
                        Task {
                            await viewModel.addComment()
                        }
                    }
                )
                .background(.thinMaterial)
            }
        }
    }
}

struct CommentInputView: View {
    @Binding var text: String
    let onSubmit: () -> Void
    
    var body: some View {
        HStack {
            TextField("Add a comment...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Post") {
                onSubmit()
            }
            .disabled(text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray.opacity(0.3)),
            alignment: .top
        )
    }
}

```

# Smile/Views/PostView.swift

```swift
//
//  Untitled.swift
//  Smile
//
//  Created by David Ding on 10/14/24.
//

import SwiftUI

struct PostView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // User Info
            HStack {
                AsyncImage(url: URL(string: "https://placekitten.com/50/50")) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                
                Text(post.username)
                    .font(.headline)
            }
            .padding(.horizontal)
            
            // Post Image
            PostImageView(
                imagePath: post.imagePath,
                size: 300
            )
            
            // Caption
            Text(post.caption)
                .padding(.horizontal)
            
            // Like and Comment Count
            HStack {
                Image(systemName: "heart")
                Text("\(post.likeCount)")
                Image(systemName: "message")
                Text("\(post.commentCount)")
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
    }
}

```

# Smile/Views/ProfileView.swift

```swift
//
//  ProfileView.swift
//  Smile
//
//  Created by David Ding on 7/31/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject private var viewModel: ProfileViewModel
    var bannerHeight: CGFloat { UIScreen.main.bounds.height * 0.20 }
    var profileImageSize: CGFloat { UIScreen.main.bounds.width * 0.28 } 
    
    init() {
            _viewModel = StateObject(wrappedValue: ProfileViewModel(authViewModel: PreviewHelpers.mockAuthViewModel))
        }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Banner and Profile Section
                ZStack(alignment: .bottomLeading) {
                    // Banner Image with Settings Button
                    ZStack(alignment: .bottomTrailing) {
                        if let user = viewModel.user,
                           let bannerUrl = user.bannerPictureUrl,
                           let url = URL(string: bannerUrl) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Image("bannerImage")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            }
                            .frame(height: bannerHeight)
                            .clipped()
                        } else {
                            Image("bannerImage")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: bannerHeight)
                                .clipped()
                        }
                        
                        Button {
                            viewModel.showingSettingsSheet = true
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(.black.opacity(0.3))
                                .clipShape(Circle())
                        }
                        .padding()
                    }
                    
                    // Profile Image
                    Button {
                        viewModel.profileImageType = .profilePicture
                        viewModel.isImagePickerShowing = true
                    } label: {
                        if let user = viewModel.user,
                           let profileUrl = user.profilePictureUrl,
                           let url = URL(string: profileUrl) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Image("defaultAvatar")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            }
                            .frame(width: profileImageSize, height: profileImageSize)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        } else {
                            Image("defaultAvatar")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: profileImageSize, height: profileImageSize)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        }
                    }
                    .offset(x: UIScreen.main.bounds.width * 0.08, y: profileImageSize / 2)
                    .shadow(radius: 10)
                }
                
                // User Info
                VStack(alignment: .leading, spacing: 4) {
                    Spacer()
                        .frame(height: profileImageSize/2 + 12)
                    
                    if let user = viewModel.user {
                        Text("\(user.firstName) \(user.lastName)")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("@\(user.username)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.leading, UIScreen.main.bounds.width * 0.08)  // Match profile image offset
                .frame(maxWidth: .infinity, alignment: .leading)  // Force left alignment
                
                // Posts Grid
                PostsGridView(
                    uploadedPosts: viewModel.uploadedPosts,
                    taggedPosts: viewModel.taggedPosts,
                    onPostDeleted: { post in
                        viewModel.removePost(post)
                    }
                )
                .environmentObject(viewModel)  // Add this line
                .padding(.top, 2)
            }
        }
        .ignoresSafeArea(.container, edges: .top)
        .sheet(isPresented: $viewModel.isImagePickerShowing) {
            ImagePicker(imageType: viewModel.profileImageType) { image in
                Task {
                    await viewModel.updateProfileImage(image, type: viewModel.profileImageType)
                }
            }
        }
        .sheet(isPresented: $viewModel.showingSettingsSheet) {
            SettingsView(viewModel: viewModel)
        }
        .onAppear {
            viewModel.updateAuthViewModel(authViewModel)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView()
                .environmentObject(PreviewHelpers.mockAuthViewModel)
        }
    }
}

```

# Smile/Views/RootView.swift

```swift
//
//  RootView.swift
//  Smile
//
//  Created by David Ding on 10/27/24.
//


import SwiftUI

struct RootView: View {
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some View {
        Group {
            if authViewModel.isAuthenticated {
                TabNavigator()
            } else {
                LoginView()
            }
        }
        .environmentObject(authViewModel)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(AuthViewModel())
    }
}
```

# Smile/Views/SearchView.swift

```swift
//
//  SearchView.swift
//  Smile
//
//  Created by David Ding on 7/31/23.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Search bar
                searchBar
                
                // Results list
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.searchResults) { user in
                            NavigationLink(destination: UserView(userId: user.id)) {
                                UserSearchCell(userPreview: user)
                            }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Search")
        }
    
    
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search users", text: $viewModel.searchText)
                .textFieldStyle(.plain)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            if !viewModel.searchText.isEmpty {
                Button {
                    viewModel.searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding()
    }
}

struct UserSearchCell: View {
    let userPreview: UserPreview
    
    var body: some View {
        HStack(spacing: 12) {
            // Profile Image
            AsyncImage(url: URL(string: userPreview.profilePictureUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image("defaultAvatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(width: 44, height: 44)
            .clipShape(Circle())
            
            // Username
            Text(userPreview.username)
                .font(.system(size: 14, weight: .semibold))
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .contentShape(Rectangle())
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

```

# Smile/Views/TabNavigator.swift

```swift
//
//  TabNavigator.swift
//  Smile
//
//  Created by David Ding on 10/27/24.
//

import SwiftUI
import PhotosUI // Add this line

struct TabNavigator: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var appState: AppState
    @State private var selectedTab = 0
    @State private var isPickerPresented = false
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State private var isUploading = false  // Add this to prevent re-entry

    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(0)
                
                SearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                    .tag(1)
                
                Color.clear
                .tabItem {
                    Label("Upload", systemImage: "plus.square")
                }
                .tag(2)
                
                GroupsView()
                    .tabItem {
                        Label("Groups", systemImage: "person.3")
                    }
                    .tag(3)
                
                ProfileView()
                    .tabItem {
                        Label("Me", systemImage: "person")
                    }
                    .tag(4)
            }
            .onChange(of: selectedTab) { newValue in
                if newValue == 2 && !isUploading {
                    isPickerPresented = true
                    selectedTab = 0
                }
            }
            .photosPicker(
                isPresented: $isPickerPresented,
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()
            )
            .onChange(of: selectedItem) { item in
                guard !isUploading else { return }  // Prevent re-entry
                if let item = item {
                    isUploading = true  // Set flag before starting upload
                    Task {
                        if let data = try? await item.loadTransferable(type: Data.self) {
                            selectedImageData = data
                        }
                        isUploading = false  // Reset flag after data is loaded
                    }
                }
            }
            .fullScreenCover(item: Binding(
                get: { selectedImageData.map { ImageData(data: $0) } },
                set: { newValue in
                    // Clear everything at once
                    withAnimation(nil) {  // Disable animation to prevent state updates from overlapping
                        selectedImageData = nil
                        selectedItem = nil
                        isPickerPresented = false
                        isUploading = false
                    }
                }
            )) { imageData in
                TaggingView(imageData: imageData.data) {
                    // Add completion handler to ensure proper cleanup
                    withAnimation(nil) {
                        selectedImageData = nil
                        selectedItem = nil
                        isPickerPresented = false
                        isUploading = false
                    }
                }
                .environmentObject(authViewModel)
                .environmentObject(appState)
            }
        }
    }
}

private struct ImageData: Identifiable {
    let id = UUID()
    let data: Data
}


//struct TabNavigator_Previews: PreviewProvider {
//    static var previews: some View {
//        PreviewHelpers.PreviewContainer {
//            TabNavigator()
//        }
//    }
//}

```

# Smile/Views/TaggingView.swift

```swift
//
//  TaggingView.swift
//  Smile
//
//  Created by David Ding on 9/18/24.
//

import Combine
import SwiftUI
import Firebase
import FirebaseAuth

struct TaggingView: View {
    @StateObject private var viewModel = TaggingViewModel()
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.dismiss) var dismiss  // Change this line
    @State private var caption = ""
    @State private var isUploading = false
    let imageData: Data
    private let dataService: DataService
    let onDismiss: () -> Void
    
    
    init(imageData: Data, dataService: DataService = FirebaseDataService(), onDismiss: @escaping () -> Void = {}) {
        self.imageData = imageData
        self.dataService = dataService
        self.onDismiss = onDismiss
    }
    
    var body: some View {
        NavigationView {
            Form {
                // Image Section
                Section {
                    if let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: UIScreen.main.bounds.width)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .listRowInsets(EdgeInsets())
                    }
                }
                
                // Caption Section
                Section(header: Text("Caption")) {
                    TextField("Write a caption...", text: $caption)
                }
                
                // Tag Users Section
                Section(header: Text("Tag Users")) {
                    TextField("Search users...", text: $viewModel.searchText)
                        .autocapitalization(.none)
                    
                    ForEach(viewModel.searchResults) { user in
                        HStack {
                            Text(user.username)
                            Spacer()
                            if viewModel.taggedUsers.contains(user) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.blue)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if viewModel.taggedUsers.contains(user) {
                                viewModel.removeTag(user)
                            } else {
                                viewModel.tagUser(user)
                                viewModel.searchText = ""
                            }
                        }
                    }
                }
                
                // Tagged Users Section
                if !viewModel.taggedUsers.isEmpty {
                    Section(header: Text("Tagged Users")) {
                        ForEach(viewModel.taggedUsers) { user in
                            HStack {
                                Text(user.username)
                                Spacer()
                                Button(action: {
                                    viewModel.removeTag(user)
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Share") {
                        uploadPost()
                    }
                    .disabled(isUploading) 
                }
            }
            .disabled(isUploading)
            .overlay {
                if isUploading {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        .overlay {
                            ProgressView()
                                .tint(.white)
                                .scaleEffect(1.5)
                        }
                }
            }
        }
        .interactiveDismissDisabled(isUploading)
    }

    private func uploadPost() {
        guard !isUploading else { return }
        isUploading = true
        
        Task {
            do {
                let imagePath = try await dataService.uploadImage(imageData)
                let taggedUsers = viewModel.taggedUsers.map { $0.id }
                
                try await dataService.createPost(
                    userId: Auth.auth().currentUser?.uid ?? "",
                    username: Auth.auth().currentUser?.displayName ?? "",
                    imagePath: imagePath,
                    caption: caption,
                    taggedUsers: taggedUsers
                )
                
                await appState.postAdded()
                
                await MainActor.run {
                    isUploading = false
                    onDismiss()
                    dismiss() // This will trigger the cleanup in TabNavigator
                }
            } catch {
                print("Upload error: \(error)")
                await MainActor.run {
                    isUploading = false
                }
            }
        }
    }
}

struct TaggingView_Previews: PreviewProvider {
    static var previews: some View {
        TaggingView(imageData: UIImage(systemName: "photo")?.pngData() ?? Data())
            .environmentObject(AuthViewModel())
            .environmentObject(AppState())
    }
}

```

# Smile/Views/Untitled.swift

```swift
//
//  Untitled.swift
//  Smile
//
//  Created by David Ding on 10/27/24.
//


```

# Smile/Views/UploadView.swift

```swift
//
//  UploadView.swift
//  Smile
//
//  Created by David Ding on 7/31/23.
//

import SwiftUI
import PhotosUI

struct UploadView: View {
    @State private var isPickerPresented = false
    @State private var selectedImageData: Data?
    
    var body: some View {
        NavigationView {
            Color.clear // Using Color.clear instead of empty VStack
                .navigationTitle("Upload")
                .photosPicker(
                    isPresented: $isPickerPresented,
                    selection: .init(get: { nil }, set: { item in
                        if let item = item {
                            Task {
                                if let data = try? await item.loadTransferable(type: Data.self) {
                                    selectedImageData = data
                                }
                            }
                        }
                    }),
                    matching: .images,
                    preferredItemEncoding: .automatic
                )
                .fullScreenCover(item: Binding(
                    get: { selectedImageData.map { ImageData(data: $0) } },
                    set: { if $0 == nil { selectedImageData = nil; isPickerPresented = true } }
                )) { imageData in
                    TaggingView(imageData: imageData.data)
                }
                .onAppear {
                    isPickerPresented = true
                }
        }
    }
}

// Helper struct to make Data conform to Identifiable
private struct ImageData: Identifiable {
    let id = UUID()
    let data: Data
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}

```

# Smile/Views/UserView.swift

```swift
//
//  UserView.swift
//  Smile
//
//  Created by David Ding on 11/10/24.
//
import SwiftUI

struct UserView: View {
    let userId: String
    @StateObject private var viewModel: UserViewModel
    let bannerHeight: CGFloat = 200
    let profileImageSize: CGFloat = 120
    
    init(userId: String) {
        self.userId = userId
        _viewModel = StateObject(wrappedValue: UserViewModel(userId: userId))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Banner and Profile Section
                ZStack(alignment: .bottomLeading) {
                    // Banner Image
                    if let user = viewModel.user,
                       let bannerUrl = user.bannerPictureUrl,
                       let url = URL(string: bannerUrl) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Image("bannerImage")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                        .frame(height: bannerHeight)
                        .clipped()
                    } else {
                        Image("bannerImage")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: bannerHeight)
                            .clipped()
                    }
                    
                    // Profile Image
                    if let user = viewModel.user,
                       let profileUrl = user.profilePictureUrl,
                       let url = URL(string: profileUrl) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Image("defaultAvatar")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                        .frame(width: profileImageSize, height: profileImageSize)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .offset(x: 20, y: profileImageSize / 2)
                        .shadow(radius: 10)
                    } else {
                        Image("defaultAvatar")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: profileImageSize, height: profileImageSize)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .offset(x: 20, y: profileImageSize / 2)
                            .shadow(radius: 10)
                    }
                }
                
                // User Info
                VStack(alignment: .leading, spacing: 8) {
                    Spacer()
                        .frame(height: profileImageSize/2 + 20)
                    
                    if let user = viewModel.user {
                        Text("\(user.firstName) \(user.lastName)")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("@\(user.username)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    // Follow/Message Buttons
                    HStack(spacing: 12) {
                        Button {
                            viewModel.toggleFollow()
                        } label: {
                            Label(viewModel.isFollowing ? "Following" : "Follow",
                                  systemImage: viewModel.isFollowing ? "person.badge.check" : "person.badge.plus")
                                .foregroundColor(viewModel.isFollowing ? .gray : .blue)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .background(viewModel.isFollowing ? Color.gray.opacity(0.2) : Color.blue.opacity(0.2))
                                .clipShape(Capsule())
                        }
                        
                        Button {
                            viewModel.sendMessage()
                        } label: {
                            Label("Message", systemImage: "message")
                                .foregroundColor(.blue)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .background(Color.blue.opacity(0.2))
                                .clipShape(Capsule())
                        }
                    }
                    .padding(.top)
                }
                .padding(.horizontal)
                
                // Posts Grid
                PostsGridView(uploadedPosts: viewModel.uploadedPosts,
                            taggedPosts: viewModel.taggedPosts,
                              onPostDeleted: nil)
                    .padding(.top)
            }
        }
        .ignoresSafeArea(.container, edges: .top)
        .task {
            await viewModel.loadProfile()
        }
    }
}

//struct UserView_Previews: PreviewProvider {
//    static var previews: some View {
//        PreviewHelpers.PreviewContainer {
//            NavigationView {
//                UserView(userId: PreviewHelpers.sampleUsers[1].id)
//            }
//        }
//    }
//}

```

# SmileTests/UserTests.swift

```swift
//
//  UserTests.swift
//  Smile
//
//  Created by David Ding on 10/14/24.
//

import Testing
@testable import Smile // Replace with your app name

@Suite("User Tests")
struct UserTests {
    @Test("User Initialization")
    func testUserInitialization() {
        let user = User(id: "123", email: "test@example.com", username: "testuser")
        #expect(user.id == "123")
        #expect(user.email == "test@example.com")
        #expect(user.username == "testuser")
    }
}

```

