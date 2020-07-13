public class Student{
	public int roll_no;
	public String name;
	Student(int roll_no, String name)
	{
		this.roll_no = roll_no;
		this.name = name;
	}
}

public class Class_array{
	public static void main(String[] args) {
		Student arr[] = new Student[5];

		arr[0] = new Student(101, "Aishu");
		arr[1] = new Student(102, "Palak");
		arr[2] = new Student(103, "Ankita");
		arr[3] = new Student(104, "Priya");
		arr[4] = new Student(105, "Sambhav");


		for (int i =0 ;i<arr.length() ;i++ ) {
			System.out.println("Element at "+i+ "is:" +arr[i]);
			
		}
	}
}