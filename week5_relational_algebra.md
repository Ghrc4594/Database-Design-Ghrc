# Week 5 Homework: Personalized Relational Algebra  
**Student:** Hanumantha  
**Student ID:** S003  
**Favorite Number:** 23  

---

## My Data Record

S003,Hanumantha,23,"Database systems organize information efficiently allowing rapid retrieval and complex queries."

## Word Extraction Queries

# Query 1: Find My Record
**Expression:**  $\sigma_{studentName = 'Hanumantha'}(StudentData)$
**Result:**: S003, Hanumantha, 23, Database systems organize information efficiently allowing rapid retrieval and complex queries.

# Query 2: Extract 3rd Word
**My 3rd word:** organize
**Expression:** $\pi_{WORD(randomParagraph, 3)}(\sigma_{studentName = 'Hanumantha'}(StudentData))$
**Explanation:** First, use Selection ($\sigma$) to isolate the record where `studentName`  equals 'Hanumantha'. Then, use Projection ($\pi$) with the hypothetical string function $WORD(randomParagraph, 3)$ to extract the third word, 'organize'.

# Query 3: Extract 7th Word
**My 7th word:** rapid
**Expression:** $\pi_{WORD(randomParagraph, 7)}(\sigma_{studentName = 'Hanumantha'}(StudentData))$
**Explanation:** Use Selection ($\sigma$) to isolate the record where `studentName` equals 'Hanumantha'. Then, use Projection ($\pi$) with the hypothetical string function $WORD(randomParagraph, 7)$ to extract the seventh word, 'rapid'.

# Query 4: Favorite Number Greater Than Yours
**Expression:** $\sigma_{favoriteNumber > 23}(StudentData)$
**Result:** All complete rows of students whose `favoriteNumber` is 24 or higher.

# Query 5: Favorite Number Less Than Yours
**Expression:** $\sigma_{favoriteNumber < 23}(StudentData)$
**Result:** All complete rows of students whose `favoriteNumber`  is 22 or lower.

# Query 6: Find students whose randomParagraph contains the same 3rd word as yours
**Expression:** $\sigma_{WORD(randomParagraph, 3) = 'organize'}(StudentData)$
**Result:** All complete rows of students for whom the third word of their `randomParagraph` is 'organize'.

# Query 7: Project studentName and favoriteNumber for favoriteNumber between 20 and 50
**Expression:** $\pi_{studentName, favoriteNumber}(\sigma_{favoriteNumber \ge 20 \land favoriteNumber \le 50}(StudentData))$
**Result:**  A table with two columns (`studentName` and `favoriteNumber`) containing the records of all students whose favorite number is between 20 and 50, inclusive

# Query 8: Find YOUR favoriteNumber using only your student_id
**Expression:** $\pi_{favoriteNumber}(\sigma_{student_id = 'S003'}(StudentData))$
**Result:** A table/set containing the single value **23**

# Query 9: Union of two groups
Find all students where (favoriteNumber > 50) OR (favoriteNumber < 10)
**Expression:** $\sigma_{favoriteNumber > 50}(StudentData) \cup \sigma_{favoriteNumber < 10}(StudentData)$
**Result:** All complete rows (records) of students whose `favoriteNumber` is either **greater than 50** or **less than 10**. This result combines the two sets of records into one single relation.

# Query 10: Set difference 
Find all students EXCEPT those with favoriteNumber between 20 and 80
**Expression:** $StudentData - \sigma_{favoriteNumber \ge 20 \land favoriteNumber \le 80}(StudentData)$
**Result:** All complete rows of students whose `favoriteNumber` is **less than 20** or **greater than 80**. (These are the students who fall outside the 20 to 80 range).

# Query 11: Intersection
Find students whose favoriteNumber is BOTH > 30 AND < 70
**Expression:** $\sigma_{favoriteNumber > 30}(StudentData) \cap \sigma_{favoriteNumber < 70}(StudentData)$
**Result:** All complete rows of students whose `favoriteNumber` is strictly **between 30 and 70** (i.e., any number from 31 to 69, inclusive).

# Query 12: Complex projection
Project only student_id and studentName for students with even favoriteNumbers
**Expression:** $\pi_{student_id, studentName}(\sigma_{favoriteNumber \bmod 2 = 0}(StudentData))$
**Result:** A table with two columns (`student\_id` and `studentName`) containing the records of all students whose `favoriteNumber` is an **even number**.

# Query 13: Multi-condition selection
Find students whose favoriteNumber equals YOUR favoriteNumber AND are NOT you
**Expression:** $\sigma_{(favoriteNumber = 23) \land (studentName \neq 'Hanumantha')}(StudentData)$
**Result:** All complete rows of students who have a `favoriteNumber` of **23** but whose `studentName`**not 'Hanumantha'**.

# Query 14: Comprehensive query 
Find count of students with favoriteNumber within $\pm 10$ of YOUR favoriteNumber (23)
**Expression:** $\sigma_{favoriteNumber \ge 13 \land favoriteNumber \le 33}(StudentData)$
**Result:** This expression returns all complete rows of students whose `favoriteNumber` is between **13 and 33**, inclusive. The final answer requires the **COUNT** of the resulting tuples in this relation.


