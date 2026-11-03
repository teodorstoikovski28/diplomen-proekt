namespace MaystorHub.Web.Models;

public enum MasterProfileStatus { Pending = 0, Approved = 1, Rejected = 2, Suspended = 3 }
public enum ServiceRequestStatus { Open = 0, HasAcceptedOffer = 1, InProgress = 2, Completed = 3, Cancelled = 4, Disputed = 5 }
public enum ServiceOfferStatus { Pending = 0, Accepted = 1, Rejected = 2, Withdrawn = 3 }
public enum WorkOrderStatus { Confirmed = 0, InProgress = 1, Completed = 2, Cancelled = 3, Disputed = 4 }
public enum VisitStatus { Proposed = 0, Confirmed = 1, Completed = 2, Delayed = 3, Cancelled = 4 }
