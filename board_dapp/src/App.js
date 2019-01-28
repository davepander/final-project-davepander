import React, { Component } from 'react';
import web3 from './web3';
import board from './board';

class App extends Component {
  state = {
    chair: '',
    BoardCreated: '',
    member: '',
    NewBoardMember: '',
    kill:''
  };
async componentDidMount() {
  const chair = await board.methods.chair().call();
  const BoardCreated = await board.methods.BoardCreated().call();
  const member = await board.methods.member().call();
  const NewBoardMember = await board.methods.NewBoardMember().call();
  const kill = await board.methods.kill().call();
this.setState({ chair, BoardCreated, member, NewBoardMember, kill });
}

onMemberCreate = async (event) => {
  event.preventDefault();
  const boardMembers = await web3.eth.getboardMembers();

  await board.methods.board(this.state.newMember).send({
    from: chair
  });
}
render() {
  return (
    <div>
      <h2>Board Contract</h2>

      <p>The Chairperson of this board is {this.state.chair}.</p>

      <p>The current members of the board are: {this.state.member}.</p>

    </div>
    <div>
    <button onClick={this.onMemberCreate}>Add Member</button>
    <h4>New Member Address<h4>
      <input></input>
    </div>


  );
}


}

export default App;
