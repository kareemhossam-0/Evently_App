import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../DM/category_dm.dart';
import '../DM/event_dm.dart';
import '../DM/userDM.dart';

class FirebaseServices {
  static CollectionReference<EventDM> getEventsCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<EventDM> eventsCollection = db
        .collection("events")
        .withConverter<EventDM>(
          fromFirestore: (snapshot, _) => EventDM.fromJson(snapshot.data()!),
          toFirestore: (event, _) => event.toJson(),
        );
    return eventsCollection;
  }

  static Future<void> addEventToFireStore(EventDM event) {
    CollectionReference<EventDM> eventsCollection = getEventsCollection();
    DocumentReference<EventDM> document = eventsCollection.doc();
    event.id = document.id;
    return document.set(event);
  }

  static Future<List<EventDM>> getEventsOneTimeRead(CategoryDM category) async {
    CollectionReference<EventDM> eventsCollection = getEventsCollection();
    QuerySnapshot<EventDM> querySnapshot =
        await eventsCollection
            .where(
              "categoryId",
              isEqualTo: category.id == "0" ? null : category.id,
            )
            .orderBy("dateTime")
            .get();
    List<QueryDocumentSnapshot<EventDM>> documentsSnapshots =
        querySnapshot.docs;
    List<EventDM> events =
        documentsSnapshots.map((docSnapshot) => docSnapshot.data()).toList();

    return events;
  }

  static Stream<List<EventDM>> getEventsRealTimeUpdates(
    CategoryDM category,
  ) async* {
    CollectionReference<EventDM> eventsCollection = getEventsCollection();
    Stream<QuerySnapshot<EventDM>> snapshots =
        eventsCollection
            .where(
              "categoryId",
              isEqualTo: category.id == "0" ? null : category.id,
            )
            .orderBy("dateTime")
            .snapshots();
    Stream<List<EventDM>> eventsStreams = snapshots.map(
      (querySnapshot) =>
          querySnapshot.docs.map((docSnapshot) => docSnapshot.data()).toList(),
    );

    yield* eventsStreams;
  }

  static Future<List<EventDM>> getFavouriteEvents() async {
    CollectionReference<EventDM> eventsCollection = getEventsCollection();
    QuerySnapshot<EventDM> querySnapshot =
        await eventsCollection
            .where(
              FieldPath.documentId,
              whereIn: UserDM.currentUSer!.favouriteEventsId,
            )
            .get();

    List<EventDM> favouriteEvents =
        querySnapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
    return favouriteEvents;
  }

  static CollectionReference<UserDM> getUsersCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<UserDM> usersCollection = db
        .collection("Users")
        .withConverter<UserDM>(
          fromFirestore:
              (snapshot, options) => UserDM.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
    return usersCollection;
  }

  static Future<void> addUserToFireStore(UserDM user) {
    CollectionReference<UserDM> usersCollection = getUsersCollection();
    DocumentReference<UserDM> userDoc = usersCollection.doc(user.id);
    return userDoc.set(user);
  }

  static Future<UserDM> getUserFromFireStore(String uid) async {
    CollectionReference<UserDM> usersCollection = getUsersCollection();
    DocumentReference<UserDM> userDoc = usersCollection.doc(uid);
    DocumentSnapshot documentSnapshot = await userDoc.get();
    UserDM user = documentSnapshot.data() as UserDM;
    return user;
  }

  static Future<void> signUp(String email, String password, String name) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    UserDM user = UserDM(
      id: credential.user!.uid,
      name: name,
      email: email,
      favouriteEventsId: [],
    );
    await addUserToFireStore(user);

    print("UserId When register : ${credential.user!.uid}");
  }

  static Future<void> signIn(String email, String password) async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    UserDM user = await getUserFromFireStore(credential.user!.uid);
    UserDM.currentUSer = user;

    print("UserId When Login  : ${user.name}");
    print("UserId When Login  : ${user.email}");
    print("UserId When Login  : ${user.id}");
    print("UserId When Login  : ${user.favouriteEventsId}");
  }

  /// Events
  ///
  static Future<void> updateUser(UserDM currentUser) {
    CollectionReference<UserDM> usersCollection = getUsersCollection();
    DocumentReference<UserDM> userDoc = usersCollection.doc(currentUser.id);
    return userDoc.set(currentUser);
  }

  static Future<void> removeEventFromFav(String eventId) async {
    UserDM currentUser = UserDM.currentUSer!;
    currentUser.favouriteEventsId.remove(eventId);
    await updateUser(currentUser);
  }

  static void addEventToFavourite(String eventId) async {
    UserDM currentUser = UserDM.currentUSer!;
    currentUser.favouriteEventsId.add(eventId);
    await updateUser(currentUser);
  }
}
