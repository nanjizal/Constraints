package constraints.demo;
import khaMath.Vector4;
// reference
// Johnathon Selstad
// @JohnSelstad
// https://git.io/fjfKH
class Chain{
    public var joints    = new Array<Vector4>();
    var points:   Int;
    var distance: Float;
    public function new( x: Float, y: Float, points_: Int, distance_: Float ){
        distance = distance_;
        points   = points_;
        for( i in 0...points ) joints[ i ] = new Vector4( x + i*distance, y, 0 );
    }
    inline
    public function update( anchor: Vector4, render: ( i: Int, joint: Vector4 ) -> Void  ){
        var joint = joints[ 0 ];
        joint.x = anchor.x;
        joint.y = anchor.y;
        render( 0, joint );
        for( i in 1...points ){
            joints[ i ] = joints[ i ].constrainDistance( joints[ i - 1 ], distance );
            joint = joints[ i ];
            render( i, joint );
        }
    }
}