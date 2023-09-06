using MediatR;
using Microsoft.AspNetCore.Mvc;
using MytraApp.Request.Command.User.AddUserCommand;
using MytraApp.Request.Query.User.GetUserQuery;

namespace MytraApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IMediator _mediator;
        public UserController(IMediator mediator)
        {
            _mediator = mediator;
        }
        [HttpPost("AddUser")]
        public async Task<ActionResult<bool>> AddUser([FromBody]AddUserCommand addUserCommand)
        {
             return Ok(await _mediator.Send(addUserCommand));
        }
        [HttpGet("GetAllUSer")]
        public async Task<ActionResult<bool>> GetAllUser([FromQuery]GetAllUserQuery getAllUserQuery)
        {
            return Ok(await _mediator.Send(getAllUserQuery));
        }
    }
}
