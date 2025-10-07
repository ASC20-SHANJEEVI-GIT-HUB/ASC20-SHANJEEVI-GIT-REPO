
public class MovieApp {

    // Base class: Movie
    static class Movie {
        private String movieName;
        private String producedBy;
        private String directedBy;
        private double duration;
        private int year;
        private String category;

        // Static variable to track number of Movie instances
        private static int moviesCount = 0;

        // Read-only movieId
        private final String movieId;

        // Constructor with mandatory fields only
        public Movie(String movieName, String producedBy) {
            if (movieName == null || producedBy == null) {
                throw new IllegalArgumentException("Movie name and producer are required.");
            }
            this.movieName = movieName;
            this.producedBy = producedBy;

            moviesCount++;
            this.movieId = movieName + "_" + moviesCount;
        }

        // Constructor with all fields, calls the mandatory constructor using this()
        public Movie(String movieName, String producedBy, String directedBy, double duration, int year, String category) {
            this(movieName, producedBy);
            this.directedBy = directedBy;
            this.duration = duration;
            this.year = year;
            this.category = category;
        }

        // Getter for movieId
        public String getMovieId() {
            return movieId;
        }

        // Static method to get the count of movies
        public static int getMoviesCount() {
            return moviesCount;
        }

        // Method to display movie details
        public String showDetails() {
            return "Movie ID: " + movieId +
                   "\nName: " + movieName +
                   "\nProduced By: " + producedBy +
                   "\nDirected By: " + (directedBy != null ? directedBy : "N/A") +
                   "\nDuration: " + (duration > 0 ? duration + " hours" : "N/A") +
                   "\nYear: " + (year > 0 ? year : "N/A") +
                   "\nCategory: " + (category != null ? category : "N/A");
        }
    }

    // Subclass: SpecialMovie (adds sound and visual effects)
    static class SpecialMovie extends Movie {
        private String soundEffects;
        private String visualEffects;

        public SpecialMovie(String movieName, String producedBy, String soundEffects, String visualEffects) {
            super(movieName, producedBy);
            this.soundEffects = soundEffects;
            this.visualEffects = visualEffects;
        }

        Override
        public String showDetails() {
            return super.showDetails() +
                   "\nSound Effects Tech: " + (soundEffects != null ? soundEffects : "N/A") +
                   "\nVisual Effects Tech: " + (visualEffects != null ? visualEffects : "N/A");
        }
    }

    // Subclass: InternationalMovie (adds country and language)
    static class InternationalMovie extends Movie {
        private String country;
        private String language;

        public InternationalMovie(String movieName, String producedBy, String country, String language) {
            super(movieName, producedBy);
            this.country = country;
            this.language = language;
        }

        Override
        public String showDetails() {
            return super.showDetails() +
                   "\nCountry: " + (country != null ? country : "N/A") +
                   "\nLanguage: " + (language != null ? language : "N/A");
        }
    }

    // Main method to test all functionality
    public static void main(String[] args) {

        // Basic movie with only required fields
        Movie m1 = new Movie("Hello", "XYZ Productions");
        System.out.println(m1.getMovieId());
        System.out.println(m1.showDetails());

        System.out.println("\n---\n");

        // Movie with all details
        Movie m2 = new Movie("Inception", "Warner Bros", "Christopher Nolan", 2.8, 2010, "Sci-Fi");
        System.out.println(m2.getMovieId());
        System.out.println(m2.showDetails());

        System.out.println("\n---\n");

        // SpecialMovie with extra effects tech
        SpecialMovie sm = new SpecialMovie("Avatar", "20th Century Fox", "Dolby Atmos", "Weta Digital");
        System.out.println(sm.getMovieId());
        System.out.println(sm.showDetails());

        System.out.println("\n---\n");

        // InternationalMovie with country and language
        InternationalMovie im = new InternationalMovie("Parasite", "Barunson E&A", "South Korea", "Korean");
        System.out.println(im.getMovieId());
        System.out.println(im.showDetails());

        System.out.println("\n---\n");

        // Show total movies created
        System.out.println("Total movies created: " + Movie.getMoviesCount());
    }
}
