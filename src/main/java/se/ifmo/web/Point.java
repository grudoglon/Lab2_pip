package se.ifmo.web;

public class Point {
    private final double x;
    private final double y;
    private final double r;
    private final boolean isGood;

    public Point(double x, double y, double r) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.isGood = checkAreas(this.x, this.y, this.r);
    }

    private boolean checkAreas(double x, double y, double r) {
        return checkTriangle(x, y, r) || checkSquare(x, y, r) || checkCircle(x, y, r);
    }

    private boolean checkTriangle(double x, double y, double r) {
        return x <= 0 && x >= -0.5 * r && y >= 0 && y <= 2 * x + 1 * r;
    }

    private boolean checkSquare(double x, double y, double r) {
        return x >= 0 && x <= r && y >= 0 && y <= r;
    }

    private boolean checkCircle(double x, double y, double r) {
        return x >= 0 && x <= r && y <= 0 && y >= -Math.sqrt(r * r - x * x);
    }

    public double getX() {
        return this.x;
    }

    public double getY() {
        return this.y;
    }

    public double getRadius() {
        return this.r;
    }

    public boolean getIsGood() {
        return this.isGood;
    }
}
