#[derive(Debug)]
pub struct ChessPosition(i32, i32);

#[derive(Debug)]
pub struct Queen {
    position: ChessPosition
}

impl ChessPosition {
    pub fn new(rank: i32, file: i32) -> Option<Self> {
        let rank_condition: bool = rank < 8 && rank >= 0;
        let file_condition: bool = file < 8 && file >= 0;
        
        if rank_condition && file_condition { //<0 y >8
            Some(ChessPosition (rank, file))
        } else {
            None
        }   
    }
}

impl Queen {
    pub fn new(position: ChessPosition) -> Self {
        Queen { position }
    }

    pub fn can_attack(&self, other: &Queen) -> bool {
        let rank1 = self.position.0;
        let file1 = self.position.1;
        let rank2 = other.position.0;
        let file2 = other.position.1;

        let cond1 = (rank1 - rank2).abs() == (file1 - file2).abs();
        let cond2 = rank1 == rank2;
        let cond3 = file1 == file2;

        cond1 || cond2 || cond3
    }
}
// rta -> row1 - row2 == col1 - col2 || row1 == row2 || col1 == col2