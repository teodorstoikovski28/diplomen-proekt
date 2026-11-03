IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema'
)
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema'
)
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema'
)
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema'
)
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema'
)
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(128) NOT NULL,
        [ProviderKey] nvarchar(128) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema'
)
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema'
)
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(128) NOT NULL,
        [Name] nvarchar(128) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema'
)
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema'
)
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema'
)
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema'
)
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema'
)
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema'
)
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema'
)
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'00000000000000_CreateIdentitySchema'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'00000000000000_CreateIdentitySchema', N'10.0.13');
END;

COMMIT;
GO

BEGIN TRANSACTION;
IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE TABLE [MasterProfiles] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [DisplayName] nvarchar(100) NOT NULL,
        [City] nvarchar(80) NOT NULL,
        [Bio] nvarchar(1500) NULL,
        [YearsExperience] int NOT NULL,
        [Status] int NOT NULL,
        [CreatedAtUtc] datetime2 NOT NULL,
        CONSTRAINT [PK_MasterProfiles] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_MasterProfiles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE TABLE [ServiceCategories] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(80) NOT NULL,
        [Description] nvarchar(400) NULL,
        [IsActive] bit NOT NULL,
        CONSTRAINT [PK_ServiceCategories] PRIMARY KEY ([Id])
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE TABLE [MasterServices] (
        [Id] int NOT NULL IDENTITY,
        [MasterProfileId] int NOT NULL,
        [ServiceCategoryId] int NOT NULL,
        [StartingPrice] decimal(10,2) NULL,
        [PriceUnit] nvarchar(20) NOT NULL,
        CONSTRAINT [PK_MasterServices] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_MasterServices_MasterProfiles_MasterProfileId] FOREIGN KEY ([MasterProfileId]) REFERENCES [MasterProfiles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_MasterServices_ServiceCategories_ServiceCategoryId] FOREIGN KEY ([ServiceCategoryId]) REFERENCES [ServiceCategories] ([Id]) ON DELETE NO ACTION
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE TABLE [ServiceRequests] (
        [Id] int NOT NULL IDENTITY,
        [ClientUserId] nvarchar(450) NOT NULL,
        [ServiceCategoryId] int NOT NULL,
        [Title] nvarchar(120) NOT NULL,
        [Description] nvarchar(3000) NOT NULL,
        [City] nvarchar(80) NOT NULL,
        [AddressDetails] nvarchar(250) NULL,
        [BudgetMin] decimal(10,2) NULL,
        [BudgetMax] decimal(10,2) NULL,
        [PreferredFromUtc] datetime2 NULL,
        [PreferredToUtc] datetime2 NULL,
        [Status] int NOT NULL,
        [CreatedAtUtc] datetime2 NOT NULL,
        CONSTRAINT [PK_ServiceRequests] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_ServiceRequests_AspNetUsers_ClientUserId] FOREIGN KEY ([ClientUserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_ServiceRequests_ServiceCategories_ServiceCategoryId] FOREIGN KEY ([ServiceCategoryId]) REFERENCES [ServiceCategories] ([Id]) ON DELETE NO ACTION
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE TABLE [ConversationMessages] (
        [Id] int NOT NULL IDENTITY,
        [ServiceRequestId] int NOT NULL,
        [SenderUserId] nvarchar(450) NOT NULL,
        [Body] nvarchar(2000) NOT NULL,
        [SentAtUtc] datetime2 NOT NULL,
        [ReadAtUtc] datetime2 NULL,
        CONSTRAINT [PK_ConversationMessages] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_ConversationMessages_AspNetUsers_SenderUserId] FOREIGN KEY ([SenderUserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_ConversationMessages_ServiceRequests_ServiceRequestId] FOREIGN KEY ([ServiceRequestId]) REFERENCES [ServiceRequests] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE TABLE [ServiceOffers] (
        [Id] int NOT NULL IDENTITY,
        [ServiceRequestId] int NOT NULL,
        [MasterProfileId] int NOT NULL,
        [ProposedPrice] decimal(10,2) NOT NULL,
        [EstimatedDays] int NOT NULL,
        [ProposedStartAtUtc] datetime2 NULL,
        [Message] nvarchar(1000) NOT NULL,
        [Status] int NOT NULL,
        [CreatedAtUtc] datetime2 NOT NULL,
        CONSTRAINT [PK_ServiceOffers] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_ServiceOffers_MasterProfiles_MasterProfileId] FOREIGN KEY ([MasterProfileId]) REFERENCES [MasterProfiles] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_ServiceOffers_ServiceRequests_ServiceRequestId] FOREIGN KEY ([ServiceRequestId]) REFERENCES [ServiceRequests] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE TABLE [WorkOrders] (
        [Id] int NOT NULL IDENTITY,
        [ServiceRequestId] int NOT NULL,
        [ServiceOfferId] int NOT NULL,
        [AgreedPrice] decimal(10,2) NOT NULL,
        [Status] int NOT NULL,
        [CreatedAtUtc] datetime2 NOT NULL,
        [CompletedAtUtc] datetime2 NULL,
        CONSTRAINT [PK_WorkOrders] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_WorkOrders_ServiceOffers_ServiceOfferId] FOREIGN KEY ([ServiceOfferId]) REFERENCES [ServiceOffers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_WorkOrders_ServiceRequests_ServiceRequestId] FOREIGN KEY ([ServiceRequestId]) REFERENCES [ServiceRequests] ([Id]) ON DELETE NO ACTION
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE TABLE [Reviews] (
        [Id] int NOT NULL IDENTITY,
        [WorkOrderId] int NOT NULL,
        [MasterProfileId] int NOT NULL,
        [ClientUserId] nvarchar(450) NOT NULL,
        [Rating] int NOT NULL,
        [Comment] nvarchar(1000) NULL,
        [CreatedAtUtc] datetime2 NOT NULL,
        CONSTRAINT [PK_Reviews] PRIMARY KEY ([Id]),
        CONSTRAINT [CK_Reviews_Rating] CHECK ([Rating] >= 1 AND [Rating] <= 5),
        CONSTRAINT [FK_Reviews_AspNetUsers_ClientUserId] FOREIGN KEY ([ClientUserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_Reviews_MasterProfiles_MasterProfileId] FOREIGN KEY ([MasterProfileId]) REFERENCES [MasterProfiles] ([Id]) ON DELETE NO ACTION,
        CONSTRAINT [FK_Reviews_WorkOrders_WorkOrderId] FOREIGN KEY ([WorkOrderId]) REFERENCES [WorkOrders] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE TABLE [Visits] (
        [Id] int NOT NULL IDENTITY,
        [WorkOrderId] int NOT NULL,
        [StartsAtUtc] datetime2 NOT NULL,
        [EndsAtUtc] datetime2 NULL,
        [Status] int NOT NULL,
        [Notes] nvarchar(500) NULL,
        CONSTRAINT [PK_Visits] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Visits_WorkOrders_WorkOrderId] FOREIGN KEY ([WorkOrderId]) REFERENCES [WorkOrders] ([Id]) ON DELETE CASCADE
    );
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'IsActive', N'Name') AND [object_id] = OBJECT_ID(N'[ServiceCategories]'))
        SET IDENTITY_INSERT [ServiceCategories] ON;
    EXEC(N'INSERT INTO [ServiceCategories] ([Id], [Description], [IsActive], [Name])
    VALUES (1, N''Ремонт и монтаж на водопроводни и канализационни инсталации'', CAST(1 AS bit), N''ВиК услуги''),
    (2, N''Електроинсталации, осветление и дребни ремонти'', CAST(1 AS bit), N''Електро услуги''),
    (3, N''Подготовка и освежаване на стени и тавани'', CAST(1 AS bit), N''Боядисване и шпакловка''),
    (4, N''Сглобяване и монтаж на мебели и оборудване'', CAST(1 AS bit), N''Монтаж на мебели''),
    (5, N''Разнообразни услуги и поправки в дома'', CAST(1 AS bit), N''Дребни домашни ремонти'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Description', N'IsActive', N'Name') AND [object_id] = OBJECT_ID(N'[ServiceCategories]'))
        SET IDENTITY_INSERT [ServiceCategories] OFF;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE INDEX [IX_ConversationMessages_SenderUserId] ON [ConversationMessages] ([SenderUserId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE INDEX [IX_ConversationMessages_ServiceRequestId] ON [ConversationMessages] ([ServiceRequestId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE UNIQUE INDEX [IX_MasterProfiles_UserId] ON [MasterProfiles] ([UserId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE UNIQUE INDEX [IX_MasterServices_MasterProfileId_ServiceCategoryId] ON [MasterServices] ([MasterProfileId], [ServiceCategoryId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE INDEX [IX_MasterServices_ServiceCategoryId] ON [MasterServices] ([ServiceCategoryId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE INDEX [IX_Reviews_ClientUserId] ON [Reviews] ([ClientUserId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE INDEX [IX_Reviews_MasterProfileId] ON [Reviews] ([MasterProfileId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE UNIQUE INDEX [IX_Reviews_WorkOrderId] ON [Reviews] ([WorkOrderId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE UNIQUE INDEX [IX_ServiceCategories_Name] ON [ServiceCategories] ([Name]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE INDEX [IX_ServiceOffers_MasterProfileId] ON [ServiceOffers] ([MasterProfileId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE UNIQUE INDEX [IX_ServiceOffers_ServiceRequestId_MasterProfileId] ON [ServiceOffers] ([ServiceRequestId], [MasterProfileId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE INDEX [IX_ServiceRequests_ClientUserId] ON [ServiceRequests] ([ClientUserId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE INDEX [IX_ServiceRequests_ServiceCategoryId] ON [ServiceRequests] ([ServiceCategoryId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE INDEX [IX_Visits_WorkOrderId] ON [Visits] ([WorkOrderId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE UNIQUE INDEX [IX_WorkOrders_ServiceOfferId] ON [WorkOrders] ([ServiceOfferId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    CREATE UNIQUE INDEX [IX_WorkOrders_ServiceRequestId] ON [WorkOrders] ([ServiceRequestId]);
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012712_InitialDomainModel'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20261103012712_InitialDomainModel', N'10.0.13');
END;

COMMIT;
GO

BEGIN TRANSACTION;
IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012911_SeedDefaultRoles'
)
BEGIN
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] ON;
    EXEC(N'INSERT INTO [AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName])
    VALUES (N''a1111111-1111-1111-1111-111111111111'', N''a1111111-1111-1111-1111-111111111111'', N''Client'', N''CLIENT''),
    (N''a2222222-2222-2222-2222-222222222222'', N''a2222222-2222-2222-2222-222222222222'', N''Master'', N''MASTER''),
    (N''a3333333-3333-3333-3333-333333333333'', N''a3333333-3333-3333-3333-333333333333'', N''Admin'', N''ADMIN'')');
    IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ConcurrencyStamp', N'Name', N'NormalizedName') AND [object_id] = OBJECT_ID(N'[AspNetRoles]'))
        SET IDENTITY_INSERT [AspNetRoles] OFF;
END;

IF NOT EXISTS (
    SELECT * FROM [__EFMigrationsHistory]
    WHERE [MigrationId] = N'20261103012911_SeedDefaultRoles'
)
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20261103012911_SeedDefaultRoles', N'10.0.13');
END;

COMMIT;
GO

