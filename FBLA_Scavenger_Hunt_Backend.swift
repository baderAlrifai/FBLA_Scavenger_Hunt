
func getContacts() -> [UserProfile] {
	let contacts = [UserProfile]()
	let defaults = UserDefaults.standard
	let counter = getCounter()
	
	if counter == 0 {
		return contacts
	}
	
	for i in 1...counter {
		if let contact = defaults.object(forKey: "contact\(i)") as? UserProfile {
			contacts.append(contact)
		}
	}
	
	return sortContactsByFirstName(contacts)
}

func doesContactExist(userProfile: UserProfile) -> Boolean {
	let defaults = UserDefaults.standard
	let counter = getCounter()
	
	if counter == 0 {
		return false
	}
	
	for i in 1...counter {
		let contact = defaults.object(forKey: "contact\(i)") as? UserProfile
		if contact.uid == userProfile.uid {
			return true
		}
	}
	return false
}

func addContact(userProfile: UserProfile) {
	var counter = getCounter() + 1
	let defaults = UserDefaults.standard
	
	defaults.set(userProfile, forKey: "contact\(counter)")
	defaults.set(counter, forKey: "counter")
}

func removeContact(userProfile) {
	let defaults = UserDefaults.standard
	let counter = getCounter()
	
	for i in 1...counter {
		let contact = defaults.object(forKey: "contact\(i)") as? UserProfile
		if contact.uid == userProfile.uid {
			defaults.removeObjectForKey("contact\(i)")
			break
		}
	}
}

func getCounter() -> Int {
	let defaults = UserDefaults.standard
	return defaults.int(forKey: "counter")
}

func createCounter() {
	let defaults = UserDefaults.standard
	defaults.set(0, forKey: "counter")
}

func decrementCounter() {
	let defaults = UserDefaults.standard
	let counter = defaults.int(forKey: "counter") - 1
	defaults.set(counter, forKey: "counter")
}

func sortContactsByFirstName(contacts: [UserProfile]): [UserProfile] {
	return contacts.sorted{
		$0.firstName < $1.firstName
	}
}

func sortContactsByLastName(contacts: [UserProfile]): [UserProfile] {
	return contacts.sorted{
		$0.lastName < $1.lastName
	}
}

func creatingDataForSignUp(firstName: String, lastName: String, uid: String, email: String) {
	setFirstName(firstName)
	setLastName(lastName)
	setUid(uid)
	setEmail(email)
	createCounter()
}

func setUid(uid: String) {
	let defaults = UserDefaults.standard
	defaults.set(uid, forKey: "uid")
}

func setChapterUid(chapterUid: String) {
	let defaults = UserDefaults.standard
	defaults.set(chapterUid, forKey: "chapterUid")
}

func setChapterIndividualUid(chapterIndividualUid: String) {
	let defaults = UserDefaults.standard
	defaults.set(chapterIndividualUid, forKey: "chapterIndividualUid")
}

func setFirstName(firstName: String) {
	let defaults = UserDefaults.standard
	defaults.set(firstName, forKey: "firstName")
}

func setLastName(lastName: String) {
	let defaults = UserDefaults.standard
	defaults.set(lastName, forKey: "lastName")
}

func setEmail(email: String) {
	let defaults = UserDefaults.standard
	defaults.set(email, forKey: "email")
}

func setBio(bio: String) {
	let defaults = UserDefaults.standard
	defaults.set(bio, forKey: "bio")
		let defaults = UserDefaults.standard
}

func setTwitterlink(link: String) {
	let defaults = UserDefaults.standard
	defaults.set(link, forKey: "twitterLink")
}

func setInstagramLink(link: String) {
	let defaults = UserDefaults.standard
	defaults.set(link, forKey: "instagramLink")
}

func setSnapchatLink(link: String) {
	let defaults = UserDefaults.standard
	defaults.set(link, forKey: "snapschatLink")
}

func setChapterName(chapterName: String) {
	let defaults = UserDefaults.standard
	defaults.set(chapterName, forKey: "chapterName")
}

func setState(state: String) {
	let defaults = UserDefaults.standard
	defaults.set(state, forKey: "state")
}

func getUid() -> String {
	let defaults = UserDefaults.standard
	return defaults.string(forKey: "uid")
}

func getChapterUid() -> String {
	let defaults = UserDefaults.standard
	return defaults.string(forKey: "chapterUid")
}

func getChapterIndividualUid() -> String {
	let defaults = UserDefaults.standard
	return defaults.string(forKey: "chapterIndividualUid")
}

func getFirstName() -> String {
	let defaults = UserDefaults.standard
	return defaults.string(forKey: "firstName")
}

func getLastName() -> String {
	let defaults = UserDefaults.standard
	return defaults.string(forKey: "lastName")
}

func getEmail() -> String {
	let defaults = UserDefaults.standard
	return defaults.string(forKey: "email")
}

func getBio() -> String {
	let defaults = UserDefaults.standard
	return defaults.string(forKey: "bio")
}

func getTwitterlink() -> String {
	let defaults = UserDefaults.standard
	return defaults.string(forKey: "twitterLink")
}

func getInstagramLink() -> String {
	let defaults = UserDefaults.standard
	return defaults.string(forKey: "instagramLink")
}

func getSnapchatLink() -> String {
	let defaults = UserDefaults.standard
	return defaults.string(forKey: "snapchatLink")
}

func getChapterName() -> String {
	let defaults = UserDefaults.standard
	return defaults.string(forKey: "chapterName")
}

func getState() -> String {
	let defaults = UserDefaults.standard
	return defaults.string(forKey: "state")
}

func getUserProfile() -> UserProfile {
	let userProfile = UserProfile(getFirstName(), getLastName(), getUid(), getBio(), getEmail(), getTwitterLink(), getInstagramLink(), getSnapchatLink()
}

func doesTasksExist()-> bool {
	let defaults = UserDefaults.standard
	let task = defaults.object(forKey: "1")
	
	if task is Task {
		return true
	}
	return false
}

func writeTasks() {
	if !doesTasksExist {
		let task1 = Task(1, "", "Take a picture with a National Officer!", 200, 2)
		let task2 = Task(2, "", "Learn about PBL at the PBL Exhibit Booth and take a picture at the booth!", 100, 1)
		let task3 = Task(3, "", "Learn about the PD at the Professional Division Booth and take a picture at the booth!", 100, 1)
		let task4 = Task(4, "", "Interact with a sponsor at the Exhibit Booth, and take a picture at the booth!", 100, 1)
		let task5 = Task(5, "", "Interact with a National Officer Candidate at a campaign booth and take a picture at the booth!", 100, 1)
		let task6 = Task(6, "", "Go to the Alamo and take a picture with a friend!", 500, 3)
		let task7 = Task(7, "", "Take a picture at the March of Dimes Walk", 100, 1)
		let task8 = Task(8, "", "Attend a workshop, and take a picture before/after the workshop!", 100, 1)
		let task9 = Task(9, "", "Take a picture with someone from another state (and make sure you both hold up your name tag", 200, 2)
		let task10 = Task(10, "", "Take a picture in front of the San Fernando Cathedral", 500, 3)
		let task11 = Task(11, "", "Take a picture at Opening Session", 100, 1)
		let task12 = Task(12, "", "Take a picture at your region meeting", 200, 2)
		let task13 = Task(13, "", "Take a picture with someone from different local chapter", 200, 2)
		let task14 = Task(14, "", "Take a picture at the Marketplace", 100, 1)
		let task15 = Task(15, "", "Take a picture at the Spanish Governor’s Palace", 500, 3)
		let task16 = Task(16, "", "Take a picture on the San Antonio RiverWalk", 200, 2)
		let task17 = Task(17, "", "Take a picture in an establishment with the Show Your Badge Program", 200, 2)
		let task18 = Task(18, "", "Take a picture at the Yanaguana Garden and Playground", 500, 3)
		let task19 = Task(19, "", "Take a picture with a candidate running for your region’s Vice President", 200, 2)
		let task20 = Task(20, "", "Take a picture at the La Villita Historic Arts Village", 500, 3)
		let task21 = Task(21, "", "Take a picture with your chapter roaming San Antonio", 100, 1)
		let task22 = Task(22, "", "Take a picture with your local adviser", 100, 1)
		let task23 = Task(23, "", "Take a picture in Hemisfair Park", 500, 3)
		let task24 = Task(24, "", "Take a picture after competing holding up a #1!", 100, 1)
		let task25 = Task(25, "", "Take a picture with a street sign (road names, stop sign, etc.)", 200, 2)
		let task26 = Task(26, "", "Take a picture with an FBLA sign", 100, 1)
		let task27 = Task(27, "", "Take a picture in professional dress in the conference center", 100, 1)
		let task28 = Task(28, "", "Take a picture with a person in a different region", 200, 2)
		let task29 = Task(29, "", "Tell someone about FBLA while exploring the town and take a picture with them holding your badge!", 500, 3)
		let task30 = Task(30, "", "Check out the Silent Auction and take a picture with the staff there!", 200, 2)
		
		let defaults = UserDefaults.standard
		defaults.set(task1, forKey: "1")
		defaults.set(task2, forKey: "2")
		defaults.set(task3, forKey: "3")
		defaults.set(task4, forKey: "4")
		defaults.set(task5, forKey: "5")
		defaults.set(task6, forKey: "6")
		defaults.set(task7, forKey: "7")
		defaults.set(task8, forKey: "8")
		defaults.set(task9, forKey: "9")
		defaults.set(task10, forKey: "10")
		defaults.set(task11, forKey: "11")
		defaults.set(task12, forKey: "12")
		defaults.set(task13, forKey: "13")
		defaults.set(task14, forKey: "14")
		defaults.set(task15, forKey: "15")
		defaults.set(task16, forKey: "16")
		defaults.set(task17, forKey: "17")
		defaults.set(task18, forKey: "18")
		defaults.set(task19, forKey: "19")
		defaults.set(task20, forKey: "20")
		defaults.set(task21, forKey: "21")
		defaults.set(task22, forKey: "22")
		defaults.set(task23, forKey: "23")
		defaults.set(task24, forKey: "24")
		defaults.set(task25, forKey: "25")
		defaults.set(task26, forKey: "26")
		defaults.set(task27, forKey: "27")
		defaults.set(task28, forKey: "28")
		defaults.set(task29, forKey: "29")
		defaults.set(task30, forKey: "30")
	}
}

func getTasks() -> [Task] {
	var tasks = [Task]()
	let defaults = UserDefaults.standard
	
	for i in 1...30 {
		let task = defaults.object(forKey: String(i)) as? Task
		tasks.append(task)
	}
	
	return sortTasksFromEasiestToHardest(taskList)
}

func sortTasksFromEasiestToHardest(tasks: [Task]) -> [Task] {
	return tasks.sorted{
		$0.difficulty < $1.difficulty
	}
}

func sortTasksFromHardestToEasiest(tasks: [Task]) -> [Task]{
	return tasks.sorted{
		$0.difficulty > $1.difficulty
	}
}

func updateTasks(taskUid: Int, taskReward: Int) {
	let uid = getuid()
	
	let userTaskRef = Database.database().reference().child("UserTasks/\(userUid)/\(taskUid)")
	userTaskRef.setValue(true)

	let taskCounterRef = Database.database().reference().child("Tasks/\(taskUid)")
	
	taskCounterRef.observeSingleEvent(of: .value) { (snapshot) in
		let counter = (snapshot.value as? Int) + 1
		taskCounterRef.setValue(counter)
		let score = round(100 * (1/pow(Double(counter), 1.0/5.0)) + taskReward)
		updateScore(score)
	}
}

func doesChapterExist(chapterCode: String) {
	let chapterDb = Database.database.reference().child("Chapters/\(chapterCode)")
	chapterDb.observeSingleEvent(of: .value) { (snapshot) in
		if snapshot.exists() {
			//GUI code here
		}
	}
}

func createChapter(chapterName: String, state: String, uid: String, chapterCode: String) {
	let chapterRef = Database.database().reference().child("Chapters/\(chapterCode)")
	chapterRef.child("points").setValue(0)
	chapterRef.child("chapterName").setValue(chapterName)
	
	let memberDb = Database.database().reference().child("ChapterMembers/\(chapterCode)")
	memberDb.child("state").setValue(state)

	joinChapter(chapterCode, uid)
}

func joinChapter(chapterUid: String) {
	let uid = getUid()
	
	let chapterMembersDb = Database.database().reference().child("ChapterMembers/\(chapterUid)")
	let chapterDb = Database.database().reference().child("Chapters/\(chapterUid)")
	let userDb = Database.database().reference().child("Users/\(uid)/points")
	
	let key = chapterMembersDb.childByAutoId().key
	chapterMembersDb.child(key).setValue(uid)

	setChapterUid(chapterUid)
	setChapterIndividualUid(key)

	
	chapterDb.observeSingleEvent(of: .value) { (snapshot) in
		let chapterScore = snapshot.child("points").value as? Int
		let chapterName = snapshot.child("chapterName").value as? String
		
		setChapterName(chapterName)
		
		chapterMembersDb.observeSingleEvent(of: .value) { (snapshot) in
			let advisor = snapshot.child("advisor").value as? String
			let state = snapshot.child("state").value as? String
			
			setAdvisor(advisor)
			setState(state)
		}
		
		userDb.observeSingleEvent(of: .value) { (snapshot) in
			let points = snapshot.value as? Int
			
			let newChapterScore = chapterScore + points
			chapterDb.child("points").setValue(newChapterScore)
		}
	}
}

func leaveChapter() {
	let uid = getUid()
	let chapterUid = getChapterUid()
	let chapterIndividualUid = getChapterIndividualUid()

	let memberDb = Database.database().reference().child("ChapterMembers/\(chapterUid)")
	let chapterDb = Database.database().reference().child("Chapters/\(chapterUid)/points")
	let userDb = Database.database().reference().child("Users/\(uid)/points")

	memberDb.child(chapterIndividualUid).removeValue()

	chapterDb.observeSingleEvent(of: .value) { (snapshot) in
		let chapterScore = snapshot.value as? Int
		
		userDb.observeSingleEvent(of: .value) { (snapshot) in
			let userScore = snapshot.value as? Int
			let newScore = chapterScore - userScore
			chapterDb.setValue(newScore)
		}
		
		memberDb.observeSingleEvent(of: .value) { (snapshot) in
			if snapshot.childrenCount as? Int <= 2 {
				memberDb.removeValue()
				let chapterDb2 = Database.database().reference().child("Chapters/\(chapterUid)")
				chapterDb2.removeValue()
			}
		}
	}

	let defaults = UserDefaults.standard
	defaults.removeObjectForKey("chapterUid")
	defaults.removeObjectForKey("chapterIndividualUid")
	defaults.removeObjectForKey("chapterName")
	defaults.removeObjectForKey("advisor")
	defaults.removeObjectForKey("state")
}

func haveChapter(): bool {
	if getChapterUid() is String {
		return true
	}
	return false
}

func getIndividualLeaderboards() {
	var users = [User]()
	
	let userRef = Database.database().reference().child("Users").queryOrdered(byChild: "points").queryLimited(toLast: 10)
	userRef.observeSingleEvent(of: .value) { (snapshot) in
		for child in snapshot1.children.allObjects as! [DataSnapshot] {
			if let dictionary = child.value as? [String: Any?] {
				let user = User()
				user.firstName = dictionary["firstName"] as! String
				user.lastName = dictionary["lastName"] as! String
				user.points = dictionary["points"] as! Int
			
				users.append(user)
			}
		}
	}
}

func getChapterLeaderboards() {
	var chapters = [Chapter]()

	let chapterRef = Database.database().reference().child("ChapterMembers").queryOrdered(byChild: "points").queryLimited(toLast: 10)
	chapterRef.observeSingleEvent(of: .value) { (snapshot) in
		for child in snapshot.children.allObjects as! [DataSnapshot] {
			if let dictionary = child.value as? [String: Any?] {
				let chapter = Chapter()
				chapter.chapterName = dictionary["chapterName"] as? String
				chapter.points = dictionary["points"] as? Int

				chapters.append(chapter)
			}
		}
		users.reverse()
	}
}

func getChapterMembers(chapterUid: Int) {
	var uids = [String]()
	var users = [User]()
		
	let chapterRef = Database.database().reference().child("ChapterMembers/\(chapterUid)")
	
	chapterRef.observeSingleEvent(of: .value) { (snapshot) in
		for (DataSnapshot child in snapshot.children) {
			if child.key != "state" && child.key != "advisor" {
				uids.append(child.value as! String)
			}
		}
		
		for i in uidList {
			let userRef = Database.database().reference().child("Users/\(i)")
			
			userRef.observeSingleEvent(of: .value) { (snapshot1) in
				for child in snapshot1.children.allObjects as! [DataSnapshot] {
					if let dictionary1 = child.value as? [String: Any?] {
						let user = User()
						user.firstName = dictionary1["firstName"] as? String
						user.lastName = dictionary1["lastName"] as? String
						user.points = dictionary1["points"] as? Int
					
						users.append(user)
						
						if users.count == uids.count {
							let sortedlist = sortUsersByRank(users)
						}
						
					}
				}
			}
		}
	}
}

func sortUsersByRank(users: [User]) -> [User] {
	return users.sorted{
		$0.points > $1.points
	}
}

func sortUsersByFirstName(users: [User]) -> [User] {
	return users.sorted{
		$0.firstName < $1.firstName
	}
}

func sortUsersByLastName(users: [User]) -> [User] {
	return users.sorted{
		$0.lastName < $1.lastName
	}
}

func updateScore(score: Int) {
	let uid = getUid()
	let chapterUid = getChapterUid()
	let chapterIndividualUid = getChapterIndividualUid()
	
	let userScoreDb = Database.database().reference().child("Users/\(uid)/points")
	let chapterScoreDb = Database.database().reference().child("Chapters/\(chapterIndividualUid)/points")

	userScoreDb.observeSingleEvent(of: .value) { (snapshot) in
		let oldScore = snapshot.value as? Int
		let newScore = oldScore + score
		userScoreDb.setValue(newScore)
		
		chapterScoreDb.observeSingleEvent(of: .value) { (snapshot) in
			let oldChapterScore = snapshot.value as? Int
			let newChapterScore = oldChapterScore + score
			chapterScoreDb.setValue(newChapterScore)
		}
	}
}


class User: NSObject  {
var firstName: String?
var lastName: String?
var points: Int?
}

class Chapter: NSObject  {
var chapterName: String?
var points: Int?
}

class Task {
var taskUid: Int
var taskTitle: String
var taskRequirement: String
var taskReward: Int
var difficulty: Int
}

class UserProfile {
var firstName: String
var lastname: String
var uid: String
var bio: String
var email: String
var twitterLink: String
var instagramLink: String
var snapchatLink: String
}