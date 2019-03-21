package constraints.demo;
import khaMath.Vector4;
// reference
// Johnathon Selstad
// @JohnSelstad
// https://git.io/fjfK1
class Inner{
    public var point:    Vector4;
    var distance: Float;
    public function new( x: Float, y: Float, distance_: Float ){
        point = new Vector4( x, y, 0 );
        distance = distance_;
    }
    inline
    public function update( anchor: Vector4 ){
        var toNext = anchor.sub( point );
        if( toNext.length > distance ) point = point.constrainDistance( anchor, distance );
    }
}