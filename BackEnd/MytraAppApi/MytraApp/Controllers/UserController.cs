using MediatR;
using Microsoft.AspNetCore.Mvc;
using MytraApp.Request.Command.User.AddUserCommand;
using MytraApp.Request.Query.User.GetUserQuery;
using MytraApp.Request.Query.User.UserLogin;

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
        [HttpPost("UserSignUp")]
        public async Task<ActionResult<string>> AddUser([FromBody]AddUserCommand addUserCommand)
        {
            try
            {
                return Ok(await _mediator.Send(addUserCommand));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }
       
        [HttpGet("GetAllUSer")]
        public async Task<ActionResult<bool>> GetAllUser([FromQuery] GetAllUserQuery getAllUserQuery)
        {
            return Ok(await _mediator.Send(getAllUserQuery));
        }
        [HttpGet("UserLogin")]
        public async Task<ActionResult<bool>> UserLogin([FromBody] UserLoginQuery userLoginQuery)
        {
            try
            {
                return Ok(await _mediator.Send(userLoginQuery));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
            
        }
    }
}
