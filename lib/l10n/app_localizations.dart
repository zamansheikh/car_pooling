import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr'),
  ];

  /// No description provided for @letSGetYouStarted.
  ///
  /// In en, this message translates to:
  /// **'Let\'s get you started!'**
  String get letSGetYouStarted;

  /// No description provided for @welcomeToHadikid.
  ///
  /// In en, this message translates to:
  /// **'Welcome to HadiKid'**
  String get welcomeToHadikid;

  /// No description provided for @getStartedByInvitingFriendsToJoinYourCarpool.
  ///
  /// In en, this message translates to:
  /// **'Get started by inviting friends to join your carpool.'**
  String get getStartedByInvitingFriendsToJoinYourCarpool;

  /// No description provided for @createCarpool.
  ///
  /// In en, this message translates to:
  /// **'Create Carpool'**
  String get createCarpool;

  /// No description provided for @createACarpoolBetweenTwoPoints.
  ///
  /// In en, this message translates to:
  /// **'Create a carpool between two points.'**
  String get createACarpoolBetweenTwoPoints;

  /// No description provided for @inviteYourFriendsToCarpoolWithYou.
  ///
  /// In en, this message translates to:
  /// **'Invite your friends to carpool with you.'**
  String get inviteYourFriendsToCarpoolWithYou;

  /// No description provided for @friendsJoinAndAddTheirChildSLocation.
  ///
  /// In en, this message translates to:
  /// **'Friends join and add their child\'s location.'**
  String get friendsJoinAndAddTheirChildSLocation;

  /// No description provided for @parentsVolunteerToDriveWeSendRemindersAndOptimizedRoutes.
  ///
  /// In en, this message translates to:
  /// **'Parents volunteer to drive. We send reminders and optimized routes.'**
  String get parentsVolunteerToDriveWeSendRemindersAndOptimizedRoutes;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @letSSetUpAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Let\'s set up an account'**
  String get letSSetUpAnAccount;

  /// No description provided for @iAgreeToHadikidS.
  ///
  /// In en, this message translates to:
  /// **'I agree to HadiKid\'s '**
  String get iAgreeToHadikidS;

  /// No description provided for @termsConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsConditions;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAnAccount;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signInYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Sign in your account'**
  String get signInYourAccount;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @donTHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get donTHaveAnAccount;

  /// No description provided for @ressetPassword.
  ///
  /// In en, this message translates to:
  /// **'Resset password'**
  String get ressetPassword;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verification;

  /// No description provided for @anOtpCodeHasBeenSentTo.
  ///
  /// In en, this message translates to:
  /// **'An OTP code has been sent to'**
  String get anOtpCodeHasBeenSentTo;

  /// No description provided for @enterTheCodeBelowToContinue.
  ///
  /// In en, this message translates to:
  /// **'Enter the code below to continue.'**
  String get enterTheCodeBelowToContinue;

  /// No description provided for @toResetPasswordIfYouDonTSeeItInYourInboxPleaseCheckYourJunkOrSpamFolderEnterTheCodeBelowToContinue.
  ///
  /// In en, this message translates to:
  /// **' to reset password. If you don\'t see it in your inbox, please check your junk or spam folder. Enter the code below to continue.'**
  String
  get toResetPasswordIfYouDonTSeeItInYourInboxPleaseCheckYourJunkOrSpamFolderEnterTheCodeBelowToContinue;

  /// No description provided for @toResetYourPasswordEnterTheCodeBelowToContinue.
  ///
  /// In en, this message translates to:
  /// **' to reset your password. Enter the code below to continue.'**
  String get toResetYourPasswordEnterTheCodeBelowToContinue;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @enterYourMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your mobile number'**
  String get enterYourMobileNumber;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// No description provided for @verifyWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Verify with Email'**
  String get verifyWithEmail;

  /// No description provided for @verifyWithPhone.
  ///
  /// In en, this message translates to:
  /// **'Verify with Phone'**
  String get verifyWithPhone;

  /// No description provided for @createNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Create new password'**
  String get createNewPassword;

  /// No description provided for @createNewPasswordHere.
  ///
  /// In en, this message translates to:
  /// **'Create new password here'**
  String get createNewPasswordHere;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @addChild.
  ///
  /// In en, this message translates to:
  /// **'Add Child'**
  String get addChild;

  /// No description provided for @addAContact.
  ///
  /// In en, this message translates to:
  /// **'Add a Contact'**
  String get addAContact;

  /// No description provided for @addContact.
  ///
  /// In en, this message translates to:
  /// **'Add Contact'**
  String get addContact;

  /// No description provided for @addSpouse.
  ///
  /// In en, this message translates to:
  /// **'Add Spouse'**
  String get addSpouse;

  /// No description provided for @addAChild.
  ///
  /// In en, this message translates to:
  /// **'Add a child'**
  String get addAChild;

  /// No description provided for @howItWorks.
  ///
  /// In en, this message translates to:
  /// **'How It Works'**
  String get howItWorks;

  /// No description provided for @whichChildRenWillAttendTheEvent.
  ///
  /// In en, this message translates to:
  /// **'Which child(ren) will attend the event?*'**
  String get whichChildRenWillAttendTheEvent;

  /// No description provided for @addAnAddress.
  ///
  /// In en, this message translates to:
  /// **'add an address'**
  String get addAnAddress;

  /// No description provided for @carpoolDetails.
  ///
  /// In en, this message translates to:
  /// **'Carpool Details'**
  String get carpoolDetails;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @startTime.
  ///
  /// In en, this message translates to:
  /// **'Start time'**
  String get startTime;

  /// No description provided for @estimatedEndTime.
  ///
  /// In en, this message translates to:
  /// **'Estimated end time'**
  String get estimatedEndTime;

  /// No description provided for @driver.
  ///
  /// In en, this message translates to:
  /// **'Driver'**
  String get driver;

  /// No description provided for @attendees.
  ///
  /// In en, this message translates to:
  /// **'Attendees'**
  String get attendees;

  /// No description provided for @deleteDriver.
  ///
  /// In en, this message translates to:
  /// **'Delete Driver'**
  String get deleteDriver;

  /// No description provided for @areYouSureYouWantToRemoveYourselfFromThisCarpool.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove yourself from this carpool?'**
  String get areYouSureYouWantToRemoveYourselfFromThisCarpool;

  /// No description provided for @removeAttendee.
  ///
  /// In en, this message translates to:
  /// **'Remove Attendee'**
  String get removeAttendee;

  /// No description provided for @areYouSureYouWantToRemoveThisAttendee.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this attendee?'**
  String get areYouSureYouWantToRemoveThisAttendee;

  /// No description provided for @invite.
  ///
  /// In en, this message translates to:
  /// **'Invite'**
  String get invite;

  /// No description provided for @dropOffComplete.
  ///
  /// In en, this message translates to:
  /// **'Drop-Off Complete'**
  String get dropOffComplete;

  /// No description provided for @myRole.
  ///
  /// In en, this message translates to:
  /// **'My Role'**
  String get myRole;

  /// No description provided for @what.
  ///
  /// In en, this message translates to:
  /// **'What'**
  String get what;

  /// No description provided for @where.
  ///
  /// In en, this message translates to:
  /// **'Where'**
  String get where;

  /// No description provided for @wouldYouLikeToSetThisLocationAsYourHomeAddress.
  ///
  /// In en, this message translates to:
  /// **'Would you like to set the starting location as your home address?'**
  String get wouldYouLikeToSetThisLocationAsYourHomeAddress;

  /// No description provided for @okay.
  ///
  /// In en, this message translates to:
  /// **'Okay'**
  String get okay;

  /// No description provided for @later.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get later;

  /// No description provided for @when.
  ///
  /// In en, this message translates to:
  /// **'When'**
  String get when;

  /// No description provided for @previewInvites.
  ///
  /// In en, this message translates to:
  /// **'Preview & Invites'**
  String get previewInvites;

  /// No description provided for @createReturnTrip.
  ///
  /// In en, this message translates to:
  /// **'Create return trip'**
  String get createReturnTrip;

  /// No description provided for @starting.
  ///
  /// In en, this message translates to:
  /// **'Starting'**
  String get starting;

  /// No description provided for @addNote.
  ///
  /// In en, this message translates to:
  /// **'Add Note'**
  String get addNote;

  /// No description provided for @eventName.
  ///
  /// In en, this message translates to:
  /// **'Event Name'**
  String get eventName;

  /// No description provided for @on.
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get on;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @invites.
  ///
  /// In en, this message translates to:
  /// **'Invites'**
  String get invites;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @invitationHasBeenSuccessfullySent.
  ///
  /// In en, this message translates to:
  /// **' Invitation has been successfully sent.'**
  String get invitationHasBeenSuccessfullySent;

  /// No description provided for @inviteSent.
  ///
  /// In en, this message translates to:
  /// **'Invite Sent!'**
  String get inviteSent;

  /// No description provided for @findFamilies.
  ///
  /// In en, this message translates to:
  /// **'Find Families'**
  String get findFamilies;

  /// No description provided for @typeAName10DigitPhoneNumberOrEmailAddressToSearch.
  ///
  /// In en, this message translates to:
  /// **' Type a name, 10-digit phone number or email address to search.'**
  String get typeAName10DigitPhoneNumberOrEmailAddressToSearch;

  /// No description provided for @inbox.
  ///
  /// In en, this message translates to:
  /// **'Inbox'**
  String get inbox;

  /// No description provided for @chats.
  ///
  /// In en, this message translates to:
  /// **'Chats'**
  String get chats;

  /// No description provided for @contactInvites.
  ///
  /// In en, this message translates to:
  /// **'Contact Invites'**
  String get contactInvites;

  /// No description provided for @carpoolInvites.
  ///
  /// In en, this message translates to:
  /// **'Carpool Invites'**
  String get carpoolInvites;

  /// No description provided for @noCarpoolInvitationsYet.
  ///
  /// In en, this message translates to:
  /// **'No carpool invitations yet'**
  String get noCarpoolInvitationsYet;

  /// No description provided for @noChatsYet.
  ///
  /// In en, this message translates to:
  /// **'No chats yet'**
  String get noChatsYet;

  /// No description provided for @noInvitationsYet.
  ///
  /// In en, this message translates to:
  /// **'No invitations yet'**
  String get noInvitationsYet;

  /// No description provided for @accountSettings.
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get accountSettings;

  /// No description provided for @notificationOfChanges.
  ///
  /// In en, this message translates to:
  /// **'Notification of Changes'**
  String get notificationOfChanges;

  /// No description provided for @changesToCarpoolsISetUp.
  ///
  /// In en, this message translates to:
  /// **'Changes to carpools I set up'**
  String get changesToCarpoolsISetUp;

  /// No description provided for @changesAffectingMyFamily.
  ///
  /// In en, this message translates to:
  /// **'Changes affecting my family'**
  String get changesAffectingMyFamily;

  /// No description provided for @changesAffectingMyDriving.
  ///
  /// In en, this message translates to:
  /// **'Changes affecting my driving'**
  String get changesAffectingMyDriving;

  /// No description provided for @drivingReminders.
  ///
  /// In en, this message translates to:
  /// **'Driving Reminders'**
  String get drivingReminders;

  /// No description provided for @participationReminders.
  ///
  /// In en, this message translates to:
  /// **'Participation Reminders'**
  String get participationReminders;

  /// No description provided for @carpoolNotesNotifications.
  ///
  /// In en, this message translates to:
  /// **'Carpool Notes Notifications'**
  String get carpoolNotesNotifications;

  /// No description provided for @notifyMeOfNewMessages.
  ///
  /// In en, this message translates to:
  /// **'Notify me of new messages'**
  String get notifyMeOfNewMessages;

  /// No description provided for @liveTracking.
  ///
  /// In en, this message translates to:
  /// **'Live Tracking'**
  String get liveTracking;

  /// No description provided for @childPickupDropOff.
  ///
  /// In en, this message translates to:
  /// **'Child Pickup / Drop-off'**
  String get childPickupDropOff;

  /// No description provided for @preference.
  ///
  /// In en, this message translates to:
  /// **'Preference'**
  String get preference;

  /// No description provided for @receiveNotificationsAndInvitationsVia.
  ///
  /// In en, this message translates to:
  /// **'Receive notifications and invitations via:'**
  String get receiveNotificationsAndInvitationsVia;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @push.
  ///
  /// In en, this message translates to:
  /// **'Push'**
  String get push;

  /// No description provided for @manageSubscription.
  ///
  /// In en, this message translates to:
  /// **'Manage Subscription'**
  String get manageSubscription;

  /// No description provided for @youCanViewUpToThreeMonthsOfPastCarpoolEvents.
  ///
  /// In en, this message translates to:
  /// **' You can view up to three months of past carpool events'**
  String get youCanViewUpToThreeMonthsOfPastCarpoolEvents;

  /// No description provided for @carpoolHistory.
  ///
  /// In en, this message translates to:
  /// **'Carpool History'**
  String get carpoolHistory;

  /// No description provided for @noDataYet.
  ///
  /// In en, this message translates to:
  /// **'No data yet'**
  String get noDataYet;

  /// No description provided for @editSpouse.
  ///
  /// In en, this message translates to:
  /// **'Edit Spouse'**
  String get editSpouse;

  /// No description provided for @editChild.
  ///
  /// In en, this message translates to:
  /// **'Edit Child'**
  String get editChild;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @carpools.
  ///
  /// In en, this message translates to:
  /// **'Carpools'**
  String get carpools;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @contactList.
  ///
  /// In en, this message translates to:
  /// **'Contact List'**
  String get contactList;

  /// No description provided for @accountSetting.
  ///
  /// In en, this message translates to:
  /// **'Account Setting'**
  String get accountSetting;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @shareHadikidWithFriends.
  ///
  /// In en, this message translates to:
  /// **'Share HadiKid with Friends'**
  String get shareHadikidWithFriends;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @areYouSureYouWantToLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get areYouSureYouWantToLogout;

  /// No description provided for @deleteMyAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete My Account'**
  String get deleteMyAccount;

  /// No description provided for @areYouSureYouWantToDeleteYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account?'**
  String get areYouSureYouWantToDeleteYourAccount;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @myCarpools.
  ///
  /// In en, this message translates to:
  /// **'My Carpools'**
  String get myCarpools;

  /// No description provided for @upcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get upcoming;

  /// No description provided for @asADriver.
  ///
  /// In en, this message translates to:
  /// **'As a Driver'**
  String get asADriver;

  /// No description provided for @myFamilyMembers.
  ///
  /// In en, this message translates to:
  /// **'My Family Members'**
  String get myFamilyMembers;

  /// No description provided for @children.
  ///
  /// In en, this message translates to:
  /// **'Children'**
  String get children;

  /// No description provided for @spouse.
  ///
  /// In en, this message translates to:
  /// **'Spouse'**
  String get spouse;

  /// No description provided for @atLeastOneChildMustBeSaved.
  ///
  /// In en, this message translates to:
  /// **'At least one child must be saved.'**
  String get atLeastOneChildMustBeSaved;

  /// No description provided for @createSpouse.
  ///
  /// In en, this message translates to:
  /// **'Create spouse'**
  String get createSpouse;

  /// No description provided for @areYouSureToRemoveYourSpouse.
  ///
  /// In en, this message translates to:
  /// **' Are you sure to remove your spouse?'**
  String get areYouSureToRemoveYourSpouse;

  /// No description provided for @thisActionCannotBeUndone.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone.'**
  String get thisActionCannotBeUndone;

  /// No description provided for @myInformation.
  ///
  /// In en, this message translates to:
  /// **'My Information'**
  String get myInformation;

  /// No description provided for @saveBack.
  ///
  /// In en, this message translates to:
  /// **'Save & Back'**
  String get saveBack;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @organizing.
  ///
  /// In en, this message translates to:
  /// **'Organizing'**
  String get organizing;

  /// No description provided for @attending.
  ///
  /// In en, this message translates to:
  /// **'Attending'**
  String get attending;

  /// No description provided for @driving.
  ///
  /// In en, this message translates to:
  /// **'Driving'**
  String get driving;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
