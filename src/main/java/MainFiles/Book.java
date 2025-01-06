package MainFiles;

public class Book {
	private String bookId;
	private String bookName;
	private String authorName;
	private String bookImg;
	private String genre;
	private double disPrice;
	private double actPrice;
	private String releaseDate;
	public Book(String bookId, String bookName, String authorName, String bookImg, String genre, double disPrice,double actPrice, String releaseDate) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.authorName = authorName;
		this.bookImg = bookImg;
		this.genre = genre;
		this.disPrice = disPrice;
		this.actPrice = actPrice;
		this.releaseDate = releaseDate;
	}


	public String getBookId() {
		return bookId;
	}


	public String getBookName() {
		return bookName;
	}


	public String getAuthorName() {
		return authorName;
	}


	public String getBookImg() {
		return bookImg;
	}


	public String getGenre() {
		return genre;
	}


	public double getDisPrice() {
		return disPrice;
	}


	public double getActPrice() {
		return actPrice;
	}


	public String getReleaseDate() {
		return releaseDate;
	}
	
	
}
