using System.ServiceModel;

using Rock.Api.Crm.Address;

namespace Rock.Api.Crm
{
	[ServiceContract]
    public partial interface IAddressService
    {
        [OperationContract]
        AddressStub Get( string id );
        
        [OperationContract]
        AddressStub Geocode( AddressStub address );

        [OperationContract]
        AddressStub Standardize( AddressStub address );
    }
}
