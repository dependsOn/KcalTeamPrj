package vo;

public class MealVO {
	private int mealnum;
	private int unum;
	private String date;
	private String time;
	private String menu;
	private int intake;
	private int kcal;
	
	public MealVO() {

	}

	public int getMealnum() {
		return mealnum;
	}

	public void setMealnum(int mealnum) {
		this.mealnum = mealnum;
	}

	public int getUnum() {
		return unum;
	}

	public void setUnum(int unum) {
		this.unum = unum;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public int getIntake() {
		return intake;
	}

	public void setIntake(int intake) {
		this.intake = intake;
	}

	public int getKcal() {
		return kcal;
	}

	public void setKcal(int kcal) {
		this.kcal = kcal;
	}
	
	
}
