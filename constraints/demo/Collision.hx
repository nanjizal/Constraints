package constraints.demo;
import khaMath.Vector4;
// reference
// Johnathon Selstad
// @JohnSelstad
// https://git.io/fjf1x
class Collision{
    var joints      = new Array<Vector4>();
    var points:     Int;
    var distance:   Float;
    var circleSize: Float;
    var x:          Float;
    var y:          Float;
    public function new( x_: Float, y_: Float
                        , points_: Int
                        , circleSize_: Float, collisionArea: Float
                        , distance_: Float ){
        x = x_;
        y = y_;
        distance    = distance_;
        points      = points_;
        circleSize  = circleSize_;
        for( i in 0...points ) {
            var x0 = x/2 + collisionArea*Math.random();
            var y0 = y/2 + collisionArea*Math.random();
            joints[ i ] = new Vector4( x0, y0, 0 );
        }
    }
    inline
    public function update( anchor: Vector4, render: ( i: Int, joint: Vector4 ) -> Void  ){
        // separate from mouse
        var joint: Vector4;
        var mouseEdge = 2;
        var radius = distance + mouseEdge + circleSize/2;
        for( i in 0...points ) {
            joint = joints[ i ];
            var toNext = anchor.sub( joint );
            if( toNext.length < radius ){
                toNext.length = radius;
                var offset = anchor.sub( joint ).sub( toNext );
                joints[ i ] = joint.add( offset );
            }
        }
        // separate balls
        var other: Vector4;
        for( i in 0...points ) for( j in i...points ) {
            joint = joints[ i ];
            other = joints[ j ];
            var toNext = other.sub( joint );
            if( toNext.length < circleSize*2 ){
                toNext.length = circleSize*2;
                var offset = other.sub( joint ).sub( toNext ).mult( 0.5 );
                joints[ i ] = joint.add( offset );
                joints[ j ] = other.sub( offset );
            }
        }
        for( i in 0...points ) render( i, joints[ i ] );
    }
}