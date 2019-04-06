package constraints.demo;
import geom.Tpoint;
// reference
// Johnathon Selstad
// @JohnSelstad
// https://git.io/fjfK1
class Inner{
    public var point:    Apoint4;
    var distance: Float;
    public function new( x: Float, y: Float, distance_: Float ){
        point = new Apoint4( {x:x, y:y, z:0., w:1.} );
        distance = distance_;
    }
    inline
    public function update( anchor: Apoint4 ){
        var toNext = anchor - point;
        if( toNext.magnitude > distance ) {
            point = point.constrainDistance( anchor, distance );
        }
    }
}
