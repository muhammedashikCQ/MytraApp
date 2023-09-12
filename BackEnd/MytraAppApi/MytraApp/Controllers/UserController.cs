using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using MytraApp.DTOs;
using MytraApp.Request.Command.Order.AddOrderCommand;
using MytraApp.Request.Command.User.AddUserCommand;
using MytraApp.Request.Query.Location.GetLocation;
using MytraApp.Request.Query.Services.GetServices;
using MytraApp.Request.Query.User.GetUserQuery;
using MytraApp.Request.Query.User.UserLogin;
using MytraModel.Models;

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
        [HttpPost("UserLogin")]
        public async Task<ActionResult<UserDto>> UserLogin([FromBody] UserLoginQuery userLoginQuery)
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
        [HttpGet("GetServices")]
        public async Task<ActionResult<Service>> GetServices([FromQuery] GetServicesQuery getServicesQuery)
        {
            return Ok(await _mediator.Send(getServicesQuery));
        }

        [HttpGet("GetLocations")]
        public async Task<ActionResult<Location>> GetLOcations([FromQuery] GetLocationQuery getLocationQuery)
        {
            return Ok(await _mediator.Send(getLocationQuery));
        }

        [HttpPost("Order")]
        public async Task<ActionResult<bool>> Order([FromBody] AddOrderCommand addOrderCommand)
        {
            try
            {
                return Ok(await _mediator.Send(addOrderCommand));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

        //[HttpGet("combined")]
        //public IActionResult GetCombinedData()
        //{
        //    var services = getServicesHandler.Handle(new GetServicesQuery());
        //    var locations = getLocationsHandler.Handle(new GetLocationQuery());

        //    var combinedData = new
        //    {
        //        Services = services,
        //        Locations = locations
        //    };

        //    return Ok(combinedData);
        //}
    }
}
